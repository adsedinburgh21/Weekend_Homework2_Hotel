require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guests.rb' )
require_relative( '../room.rb' )
require_relative( '../reception.rb' )

class TestReception < MiniTest::Test

  def setup
    
    @room1 = Room.new( { name: "Room 1", room_size: 1, daily_rate: 50} )
    @room2 = Room.new( { name: "Room 2", room_size: 1, daily_rate: 50} )
    @room3 = Room.new( { name: "Room 3", room_size: 1, daily_rate: 70} )
    @room4 = Room.new( { name: "Room 4",  room_size: 1, daily_rate: 70} )
    @room5 = Room.new( { name: "Room 5", room_size: 2, daily_rate: 90} )
    @room6 = Room.new( { name: "Room 6", room_size: 2, daily_rate: 90} )
    @room7 = Room.new( { name: "Room 7", room_size: 2, daily_rate: 120} )
    @room8 = Room.new( { name: "Room 8", room_size: 2, daily_rate: 120} )


    @guests1 = Guests.new({name: "The Reids", number_of_guests: 2, money: 5000, days_booked: 7})
    @guests2 = Guests.new({name: "The Bennetts", number_of_guests: 2, money: 1000, days_booked: 4})
    @guests3 = Guests.new({name: "Ozzy Osbourne", number_of_guests: 1, money: 500, days_booked: 3})
    @guests4 = Guests.new({name: "Jack Black", number_of_guests: 1, money: 200, days_booked: 1})
    @guests5 = Guests.new({name: "Duff McKagan", number_of_guests: 1, money: 1000, days_booked: 1})

    


    @all_rooms = [ @room1, @room2, @room3, @room4, @room5, @room6, @room7, @room8 ]


    @all_guests = [ @guests1, @guests2, @guests3, @guests4, @guests5 ]


    @reception = Reception.new(hotel_name: "The Mega Rad-ison", rooms: @all_rooms, guests: @all_guests)



  end

  def test_hotel_name
    assert_equal("The Mega Rad-ison", @reception.hotel_name)
  end

  def test_hotel_revenue
    assert_equal(0, @reception.revenue)
  end

  # def test_hotel_revenue_after_guests_check_out
  #   @room1.check_in(@guests3)
  #   @reception.final_guests_checkout(@guests3, @room1)
  #   assert_equal(150, @reception.revenue)
  # end

  def test_hotel_total_rooms
    assert_equal(8, @reception.hotel_total_rooms)
  end

  def test_hotel_max_occupancy
    result = @reception.hotel_max_occupancy
    assert_equal(12, result)
  end

  # def test_hotel_current_occupancy
  # end

  # def test_vacant_rooms
  # end

  # def test_occupied_rooms
  # end
    

  def test_bill_total
    result = @reception.bill_total(@guests1, @room8)
    assert_equal(840, result)
  end

  def test_credit_hotel
    @reception.credit_hotel(600)
    assert_equal(600, @reception.revenue)
  end

  def test_debit_hotel
    @reception.debit_hotel( 500 )
    assert_equal(-500, @reception.revenue)
    
  end

  def test_final_guests_checkout_occupied_room
    @room8.check_in( @guests1 )
    @reception.final_guests_checkout( @guests1, @room8 )
    assert_equal( 840, @reception.bill_total(@guests1, @room8) )
    assert_equal( 4160, @guests1.money )
    assert_equal( 840, @reception.revenue )
    assert_equal( nil, @room8.check_out )
  end

  def test_ensure_guests_not_charged_if_empty_room_is_entered_in_error_when_doing_final_guests_checkout
    @reception.final_guests_checkout( @guests1, @room8 )
    assert_equal( 840, @reception.bill_total(@guests1, @room8) )
    assert_equal( 5000, @guests1.money )
    assert_equal( 0, @reception.revenue )
  end
end