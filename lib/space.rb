require 'pg'

class Space
  attr_reader :id, :name, :description, :price, :user_id

  def initialize(id:, name:, description:, price:, user_id:)
    @id = id
    @name = name
    @description = description
    @price = price
    @user_id = user_id 
  end

  
  def self.all
    result = DatabaseConnection.setup.query("SELECT * FROM spaces;")
    result.map do |space|
      Space.new(id: space['id'], name: space['name'], description: space['description'], price: space['price'], user_id: space['user_id'])
    end 
  end
  
  def self.create(name:, description:, price:, user_id:, available_from:, available_to:)
    result = DatabaseConnection.setup.query("INSERT INTO spaces (name, description, price, user_id)
    VALUES($1, $2, $3, $4) returning id, name, description, price, user_id;",
    [name, description, price, user_id])
    
    start_date = Date.parse(available_from)
    end_date = Date.parse(available_to)
    dates = (start_date..end_date).to_a

    connection = DatabaseConnection.setup

    dates.map do |date|
      connection.query("INSERT INTO available_dates (space_id, date) VALUES($1, $2);", 
    [result[0]['id'], date])
    end
    
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      user_id: result[0]['user_id'],
    )

  end

  def self.find(id:)
    result = DatabaseConnection.setup.query("SELECT * FROM spaces WHERE id = $1;",
    [id])
    
    Space.new(
      id: result[0]['id'],
      name: result[0]['name'],
      description: result[0]['description'],
      price: result[0]['price'],
      user_id: result[0]['user_id']
    )
  end 

end
