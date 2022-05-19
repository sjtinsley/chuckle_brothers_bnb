feature 'Responding to booking requests' do
  before(:each) do 
    host = User.create(username: 'test', email: 'test@email.com', password: 'bobbychuckle')
    guest = User.create(username: 'test2', email: 'test2@email.com', password: 'bobbychuckle')
    space = Space.create(name: 'space name', description: 'description', price: 4, user_id: host.id)
    booking = BookingRequest.create(space_id: 1, date: '2022-05-17', guest_id: guest.id)
  end
    
  xscenario 'user can approve booking requests for their spaces' do
    
    visit '/host/requests'

    choose(option: '1')
    click_button 'Approve'
    expect(page).to have_content 'Approved booking #1 for space name'
  end
 
    
  xscenario 'user can reject booking requests for their spaces' do
    
    visit '/host/requests'

    choose(option: '1')
    click_button 'Reject'
    expect(page).to have_content 'Rejected booking #1 for space name'
  end
end 
