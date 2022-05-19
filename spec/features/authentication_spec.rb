feature 'User authentication' do
  scenario 'User can log in' do
    User.create(username: 'user1', email: 'user@usermail.com', password: 'password1')
    visit '/sessions/new'
    fill_in :email, with: 'user@usermail.com'
    fill_in :password, with: 'password1'
    click_button 'Log In'

    expect(page).to have_content 'Welcome user1'
  end
  
  scenario 'User can log out' do
    User.create(username: 'user1', email: 'user@usermail.com', password: 'password1')
    visit '/sessions/new'
    fill_in :email, with: 'user@usermail.com'
    fill_in :password, with: 'password1'

    click_button 'Log In'
    click_button 'Log Out'
  
    expect(page).not_to have_content 'Welcome user1'
    expect(page).to have_content 'You have logged out successfully'
  end
end 
