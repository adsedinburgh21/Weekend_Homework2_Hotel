require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room.rb' )

class RoomTest < MiniTest::Test

  def setup
    @room1 = Room.new( { name: "Room 1", room_size: 2, daily_rate: 50} )

    @guest1 = "Steve"

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

  def test_current_guests_start_empty
    assert_equal([], @room1.current_guests)
  end

  def test_check_in
    @room1.check_in(@guest1)
    assert_equal([@guest1], @room1.current_guests)
  end

  def test_check_out
    @room1.check_in(@guest1)
    @room1.check_out
    assert_equal( [], @room1.current_guests)
  end
end