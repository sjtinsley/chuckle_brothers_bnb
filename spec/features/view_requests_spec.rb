feature 'Responding to booking requests' do
  before(:each) do 
    DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
      VALUES($1, $2, $3, $4);", 
      [1, 'host', 'host@email.com', 'encrypted_pass'])   
    guest = User.create(username: 'test2', email: 'test2@email.com', password: 'bobbychuckle')
    space = Space.create(name: 'SpaceName', description: 'description', price: 4, user_id: 1)
    booking = BookingRequest.create(space_id: space.id, date: '2022-05-17', guest_id: guest.id)
  end
    
  scenario 'user can see at least one booking request' do
    page.set_rack_session(:user_id => '1')
    page.visit '/host/requests'
    expect(page).to have_content 'SpaceName'
  end

  scenario 'user can approve booking requests for their spaces' do
    page.set_rack_session(:user_id => '1')
    visit '/host/requests'
    find(".option", match: :first).set(true)
    click_button 'Approve'
    expect(page).to have_content 'approved booking for SpaceName'
  end
 
    
  scenario 'user can reject booking requests for their spaces' do
    page.set_rack_session(:user_id => '1')
    visit '/host/requests'
    find(".option", match: :first).set(true)
    click_button 'Reject'
    expect(page).to have_content 'rejected booking for SpaceName'
  end
end 
