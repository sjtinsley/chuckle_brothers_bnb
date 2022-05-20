describe BookingRequest do
  before(:each) { DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
    VALUES($1, $2, $3, $4);", 
    [1, 'username', 'email', 'encrypted_pass']) }
  describe '.create' do
    it 'should add a booking request to the database' do
      expect(BookingRequest.create(space_id: 1, date: '2022-05-17', guest_id: 1)).to be_an_instance_of(BookingRequest).and have_attributes(space_id: '1', date: '2022-05-17', guest_id: '1')
    end
  end

  describe '.find' do
    it "selects specific booking request by id" do
      booking_request = BookingRequest.create(space_id: '1', date: '2022-05-17', guest_id: 1)
      found_booking_request = BookingRequest.find(id: booking_request.id)
      
      expect(booking_request).to be_an_instance_of(BookingRequest).and have_attributes(space_id: '1', date: '2022-05-17', guest_id: '1')
    end
  end

  describe '#approve' do
    it 'responds to booking requests by approving them' do
      booking_request = BookingRequest.create(space_id: 1, date: '2022-05-17', guest_id: 1)
      approved_booking_request = booking_request.approve(id: booking_request.id)
      p booking_request.id
      expect(approved_booking_request.approved).to eq 't'
    end
  end 

  describe '#reject' do
    it 'responds to booking requests by rejecting them' do
      booking_request = BookingRequest.create(space_id: 1, date: '2022-05-17', guest_id: 1)
      rejected_booking_request = booking_request.reject(id: booking_request.id) 

      expect(rejected_booking_request.approved).to eq 'f'
    end
  end

  describe '.all_for_user' do
    it 'should return all booking requests for the logged in host user' do
      DatabaseConnection.setup.query("INSERT INTO users (id, username, email, password)
      VALUES($1, $2, $3, $4);", 
      [2, 'username2', 'email2', 'encrypted_pass2'])

      DatabaseConnection.setup.query("INSERT INTO spaces (id, name, description, price, user_id)
      VALUES($1, $2, $3, $4, $5);", 
      [1, 'spacename', 'description', 5, 2])

      booking_request = BookingRequest.create(space_id: 1, date: '2022-05-17', guest_id: 1)

      space = Space.find(id: booking_request.space_id)

      host_booking_requests = BookingRequest.all_for_user(id: space.user_id)

      expect(host_booking_requests.first.id).to eq booking_request.id
    end
  end
end