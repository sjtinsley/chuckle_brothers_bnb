require 'spaces'

describe Spaces do
  it "shows available spaces" do
    view_spaces = Spaces.all
    expect(view_spaces).to include("Space1", "Space2", "Space3")
  end
end