require 'space'

describe Space do
  describe '.create' do
    it 'should add a space to the database' do
      expect(Space.create(name: 'name', description: 'description', price: 4)).to be_an_instance_of(Space).and have_attributes(name: 'name', description: 'description', price: "4")
    end
  end

  describe '.all' do
    it "shows available spaces" do
      first_space = Space.create(name: 'Space1', description: 'description1', price: 1)
      Space.create(name: 'name2', description: 'description2', price: 4)
      Space.create(name: 'name3', description: 'description3', price: 4)

      spaces = Space.all

      expect(spaces.length).to eq 3
      expect(spaces.first).to be_a Space
      expect(spaces.first.id).to eq first_space.id
      expect(spaces.first.name).to eq "Space1"
      expect(spaces.first.price).to eq "1"
    end
  end

  describe '.find' do
    it "selects specific space by id" do
      space = Space.create(name: 'Space1', description: 'description1', price: 1)
      found_space = Space.find(id: space.id)
      

      expect(found_space).to be_an_instance_of(Space).and have_attributes(name: 'Space1', description: 'description1', price: '1')
    end
  end 


end