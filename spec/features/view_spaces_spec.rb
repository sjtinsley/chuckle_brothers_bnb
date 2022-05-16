require 'capybara/rspec'

feature "view spaces" do
  scenario "user can see the available spaces" do
    visit("/spaces")

    expect(page).to have_content("Available Spaces")
  end
end