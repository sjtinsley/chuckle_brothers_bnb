require 'pg'

class DatabaseConnection 
  def self.setup
    if ENV['RACK_ENV'] == 'test'
      @connection = PG.connect(dbname: 'chuckle_hotel_test')
    else
      @connection = PG.connect(dbname: 'chuckle_hotel')
    end
  end

  def self.connection
    @connection
  end

  def self.query(sql, params = [])
    @connection.exec_params(sql, params)
  end
end