require 'pg'

class Spaces
  attr_reader :spaces

  def initialize(spaces:)
    @spaces = spaces
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chuckle_hotel_test')
    else
      con = PG.connect(dbname: 'chuckle_hotel')
    end

    res = con.exec("SELECT * FROM spaces;")
    res.map { |space| space['name'] }
  end
end