require 'capybara/rspec'

feature "view spaces" do
  scenario "user can see the available spaces" do
    Space.create(name: 'name', description: 'description', price: 4)
    visit("/spaces")
    
    expect(page).to have_content('name')
   
    
  end
end