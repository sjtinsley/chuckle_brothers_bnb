feature "user sign up" do
  scenario "user can sign up" do
    visit '/users/new'
    fill_in 'username', with: 'testusername'
    fill_in 'password', with: 'testpassword'
    fill_in 'email', with: 'test@email.com'
    click_button 'Create Account'
    expect(page).to have_content('Thank you testusername. You are now signed up to ChuckleHotel')
  end
end