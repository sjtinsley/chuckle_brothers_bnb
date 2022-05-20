feature 'create booking request' do
  before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
    VALUES($1, $2, $3, $4);", 
    [1, 'username1', 'user1@usermail.com', 'password1']) }
    
  scenario 'user selects a space, enters a date and clicks request booking' do
    visit('/')
    fill_in :username, with: 'username2'
    fill_in :email, with: 'user2@usermail.com'
    fill_in :password, with: 'password2'
    click_button 'Submit'
    
   
    space = Space.create(
      name: 'space name', 
      description: 'description', 
      price: 4, 
      user_id: 1, 
      available_from: '2022-05-20', 
      available_to: '2022-06-10'
    )
    visit '/spaces'
    first('.space').click
    fill_in 'date', with: '2022-05-21'
    click_button 'Request Booking'
    expect(page).to have_content "Thank you for requesting to book space name, the host will respond within 24 hours"
  end
end
