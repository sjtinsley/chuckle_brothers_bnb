require 'space'

describe Space do
  before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
    VALUES($1, $2, $3, $4);", 
    [1, 'username', 'email', 'encrypted_pass']) }
  
  describe '.create' do
    it 'should add a space to the database' do
      expect(Space.create(
        name: 'name', 
        description: 'description', 
        price: 4, 
        user_id: 1, 
        available_from: '2022-05-20', 
        available_to: '2022-06-10'
        )).to be_an_instance_of(Space).and have_attributes(name: 'name', description: 'description', price: '4', user_id: '1')
    end
  end

  describe '.all' do
    it "shows available spaces" do
      first_space = Space.create(
        name: 'Space1', 
        description: 'description1', 
        price: 1, 
        user_id: 1, 
        available_from: '2022-05-20', 
        available_to: '2022-06-10'
      )

      spaces = Space.all

      expect(spaces.length).to eq 1
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq first_space.id
      expect(spaces.first.name).to eq "Space1"
      expect(spaces.first.price).to eq "1"
      expect(spaces.first.user_id).to eq "1"
    end
  end

  describe '.find' do
    it "selects specific space by id" do
      space = Space.create(
        name: 'Space1', 
        description: 'description1', 
        price: 1, 
        user_id: 1,
        available_from: '2022-05-20', 
        available_to: '2022-06-10'
      )

      found_space = Space.find(id: space.id)
      

      expect(found_space).to be_an_instance_of(Space).and have_attributes(
        name: 'Space1', 
        description: 'description1', 
        price: '1', 
        user_id: '1',
      )
    end
  end 

  # describe '.find_by_user_id' do
    
  # end


end