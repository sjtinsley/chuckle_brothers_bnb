require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email, :pass_hash

  def initialize(id:, username:, email:, pass_hash:)
    @id = id
    @username = username
    @email = email
    @pass_hash = pass_hash
  end

  def self.create(username:, email:, password:)
   
    encrypted_pass = BCrypt::Password.create(password)
    
    # p password
    # p encrypted_pass

    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chuckle_hotel_test')
    else
      connection = PG.connect(dbname: 'chuckle_hotel')
    end

    result = connection.exec_params("INSERT INTO users (username, email, password)
    VALUES($1, $2, $3) returning id, username, email, password;",
    [username, email, encrypted_pass])

    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email'],
      pass_hash: result[0]['password']
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
      User.new(id: user['id'], username: user['username'], email: user['email'], pass_hash:user['password'])
    end
  end
  
end