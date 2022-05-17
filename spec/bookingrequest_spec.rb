describe BookingRequest do
  describe '.create' do
    it 'should add a booking request to the database' do
      expect(BookingRequest.create(space_id: 1, date: '2022-05-17')).to be_an_instance_of(BookingRequest).and have_attributes(space_id: '1', date: '2022-05-17')
    end
  end

  describe '.find' do
    it "selects specific booking request by id" do
      booking_request = BookingRequest.create(space_id: 1, date: '2022-05-17')
      found_booking_request = BookingRequest.find(id: booking_request.id)
      
      expect(found_booking_request.id).to eq(booking_request.id)
      expect(found_booking_request.space_id).to eq(booking_request.space_id)
      expect(found_booking_request.date).to eq(booking_request.date)
    end
  end
end