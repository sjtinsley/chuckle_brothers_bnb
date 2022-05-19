require 'pg'
require 'bcrypt'

class User
  attr_reader :id, :username, :email

  def initialize(id:, username:, email:)
    @id = id
    @username = username
    @email = email
  end

  def self.create(username:, email:, password:)
   
    encrypted_pass = BCrypt::Password.create(password)

    result = DatabaseConnection.setup.query("INSERT INTO users (username, email, password)
    VALUES($1, $2, $3) returning id, username, email;", 
    [username, email, encrypted_pass])

    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email']
    )
  end

  def self.all
    result = DatabaseConnection.setup.query("SELECT * FROM users;")
    result.map do |user|
      User.new(
        id: user['id'],
        username: user['username'],
        email: user['email']
      )
    end
  end
  
  def self.authenticate(email:, password:)
    result = DatabaseConnection.setup.query("SELECT * FROM users WHERE email = $1;",
    [email])

    return unless result.any?
    return unless BCrypt::Password.new(result[0]['password']) == password
    User.new(
      id: result[0]['id'],
      email: result[0]['email'],
      username: result[0]['username']
    )
  end

  def self.find(id:)
    result = DatabaseConnection.setup.query("SELECT * FROM users WHERE id = $1;",
    [id])
    
    User.new(
      id: result[0]['id'],
      username: result[0]['username'], 
      email: result[0]['email']
    )
  end 
end