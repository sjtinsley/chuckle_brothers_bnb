require 'user'

describe User do
  describe '.create' do
    it 'should add a user to the database' do
      expect(User.create(username: 'test', email: 'test@email.com', password: "bobbychuckle")).to be_an_instance_of(User).and have_attributes(username: 'test', email: 'test@email.com')
    end

    it 'hashes the password using BCrypt' do
      a = User.create(username: 'test', email: 'test@email.com', password: "bobbychuckle")
      expect(a.pass_hash.length).to eq 60
    end

  end

  describe '.all' do
    it "returns users" do
      first_user = User.create(username: 'test', email: 'test@email.com', password: "bobbychuckle")

      user = User.all

      expect(user.first).to be_an_instance_of(User).and have_attributes(username: 'test', email: 'test@email.com')
    end
  end
end