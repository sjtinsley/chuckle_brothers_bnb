class BookingRequest
  attr_reader :id, :space_id, :date

  def initialize(id: ,space_id: ,date:)
    @id = id
    @space_id = space_id
    @date = date
  end

  def self.create(space_id: ,date:)
    if ENV['RACK_ENV'] == 'test'
      connection = PG.connect(dbname: 'chuckle_hotel_test')
    else
      connection = PG.connect(dbname: 'chuckle_hotel')
    end

    result = connection.exec_params("INSERT INTO booking_requests (space_id, date)
      VALUES($1, $2) returning id, space_id, date;",
      [space_id, date])

    BookingRequest.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
    )
  end
end