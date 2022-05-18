feature 'User authentication' do
  scenario 'User can log in' do
    User.create(username: 'user1', email: 'user@usermail.com', password: 'password1')
    visit '/sessions/new'
    fill_in :email, with: 'user@usermail.com'
    fill_in :password, with: 'password1'
    click_button 'Log In'

    expect(page).to have_content 'Welcome user1'
  end
end 
