require 'space'

describe Space do
  describe '.create' do
    it 'should add a space to the database' do
      expect(Space.create(name: 'name', description: 'description', price: 4)).to be_an_instance_of(Space).and have_attributes(name: 'name', description: 'description', price: "$4.00")
    end
  end
end