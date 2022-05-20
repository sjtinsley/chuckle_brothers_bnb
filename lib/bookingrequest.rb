class BookingRequest
  attr_reader :id, :space_id, :date, :guest_id, :approved

  def initialize(id:, space_id:, date:, guest_id:, approved:)
    @id = id
    @space_id = space_id
    @date = date
    @guest_id = guest_id
    @approved = approved
  end

  def self.create(space_id:, date:, guest_id:)
    result = DatabaseConnection.setup.query("INSERT INTO booking_requests (space_id, date, guest_id)
      VALUES($1, $2, $3) returning id, space_id, date, guest_id;",
      [space_id, date, guest_id])

    BookingRequest.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      guest_id: result[0]['guest_id'],
      approved: result[0]['approved']
    )
  end

  def self.find(id:)
    result = DatabaseConnection.setup.query("SELECT * FROM booking_requests WHERE id = $1;",
    [id])

    BookingRequest.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      guest_id: result[0]['guest_id'],
      approved: result[0]['approved']
    )
  end

  def approve(id:)
    result = DatabaseConnection.setup.query("UPDATE booking_requests SET approved = true WHERE id = $1 RETURNING id, space_id, date, guest_id, approved;",
    [id])

    BookingRequest.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      guest_id: result[0]['guest_id'],
      approved: result[0]['approved']
    )
  end

  def reject(id:)
    result = DatabaseConnection.setup.query("UPDATE booking_requests SET approved = false WHERE id = $1 RETURNING id, space_id, date, guest_id, approved;",
    [id])

    BookingRequest.new(
      id: result[0]['id'],
      space_id: result[0]['space_id'],
      date: result[0]['date'],
      guest_id: result[0]['guest_id'],
      approved: result[0]['approved']
    )
  end
end