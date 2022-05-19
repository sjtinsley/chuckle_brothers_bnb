feature 'add space' do
  scenario 'user can create a space' do
    user = User.create(username: 'test', email: 'test@email.com', password: 'bobbychuckle')
    visit 'sessions/new'
    fill_in 'email', with: 'test@email.com'
    fill_in 'password', with: 'bobbychuckle'
    click_button 'Log In'
    visit '/spaces/new'
  
    fill_in 'name', with: 'Testname'
    fill_in 'description', with: 'Testdescription'
    fill_in 'price', with: 4
    fill_in 'available_from', with: '2022-05-25'
    fill_in 'available_to', with: '2022-06-10'
    # page.fill_in :placeholder => 'available_from', with: '2022-05-25'
    # page.fill_in :placeholder => 'available_to', with: '2022-06-10'
    click_button 'Create Space'

    expect(page).to have_content 'Thank you for adding Testname to Chuckle Hotel'
  end


end
