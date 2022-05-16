require 'pg'

class Space
  attr_reader :id, :name, :description, :price

  def initialize(id:, name:, description:, price:)
    @id = id
    @name = name
    @description = description
    @price = price

  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      con = PG.connect(dbname: 'chuckle_hotel_test')
    else
      con = PG.connect(dbname: 'chuckle_hotel')
    end

    res = con.exec("SELECT * FROM spaces;")
    res.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'])
    end 
  end
end