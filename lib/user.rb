require 'pg'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chuckle_hotel_test')
    else
      connection = PG.connect(dbname: 'chuckle_hotel')
    end

    result = connection.exec_params("INSERT INTO users (username, email, password)
    VALUES($1, $2, $3) returning id, username, email;",
    [username, email, password])

    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email']
    )
  end

  def self.all
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chuckle_hotel_test')
    else
      connection = PG.connect(dbname: 'chuckle_hotel')
    end

    result = connection.exec("SELECT * FROM users;")
    result.map do |user|
      User.new(id: user['id'], username: user['username'], email: user['email'])
    end
  end
end