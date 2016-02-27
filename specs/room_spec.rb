require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room.rb' )
require_relative( '../guests.rb')

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new( { name: "Room 1", room_size: 2, daily_rate: 50} )


    @guests1 = Guests.new({name: "The Reids", number_of_guests: 2, money: 5000, days_staying: 7})
  
    @guests2 = Guests.new({name: "The Bennetts", number_of_guests: 1, money: 1000, days_booked: 4})

    @guests3 = Guests.new({name: "Motorhead", number_of_guests: 3, money: 3000, days_booked: 2})

  end

  def test_has_room_got_name
    assert_equal("Room 1", @room1.name)
  end

  def test_room_size
    assert_equal(2, @room1.room_size)
  end

  def test_daily_rate
    assert_equal(50, @room1.daily_rate)
  end

  def test_rooms_start_empty
    assert_equal(nil, @room1.current_guests)
  end

  def test_check_in_vacant_room
    @room1.check_in(@guests1)
    assert_equal(@guests1, @room1.current_guests)
  end

  def test_check_in_occupied_room
    @room1.check_in(@guests1)
    @room1.check_in(@guests2)
    assert_equal(@guests1, @room1.current_guests)
  end

  def test_check_in_over_room_capacity
    @room1.check_in(@guests3)
    assert_equal(nil, @room1.current_guests)
  end

  def test_check_out
    @room1.check_in(@guests1)
    @room1.check_out
    assert_equal( nil, @room1.current_guests)
  end

  def test_current_occupancy
    @room1.check_in(@guests2)
    assert_equal(1, @room1.current_occupancy)
  end

  def test_current_occupancy_vacant_room
    assert_equal(0, @room1.current_occupancy)
  end

end