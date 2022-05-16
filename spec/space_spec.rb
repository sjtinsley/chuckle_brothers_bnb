require 'space'

describe Space do
  it "shows available spaces" do
    spaces = Space.all

    expect(spaces.length).to eq 3
    expect(spaces.first).to be_a Space
    expect(spaces.first.id).to eq "1" #dodgy because id will increment later- currently do not have a .create method to rectify this
    expect(spaces.first.name).to eq "Space1"
    expect(spaces.first.price).to eq "$1.00"
  end
end