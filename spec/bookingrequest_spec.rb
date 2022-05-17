describe BookingRequest do
  describe '.create' do
    it 'should add a booking request to the database' do
      expect(BookingRequest.create(space_id: 1, date: '2022-05-17')).to be_an_instance_of(BookingRequest).and have_attributes(space_id: '1', date: '2022-05-17')
    end
  end
end