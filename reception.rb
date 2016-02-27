class Reception

  attr_reader :hotel_name, :revenue

  def initialize(params)
    @revenue = 0
    @hotel_name = params[:hotel_name]
    @all_rooms = params[:rooms]
    @all_guests = params[:guests]
  end

  def hotel_total_rooms
    return @all_rooms.length
  end

  def hotel_max_occupancy
    hotel_max_occupancy = 0
    for room in @all_rooms
      hotel_max_occupancy += room.room_size
    end
    return hotel_max_occupancy 
  end
  #### could I use a block here ?? (and below)

#### DO TEST FOR THIS !
  def hotel_current_occupancy
    hotel_current_occupancy = 0
    for room in @all_rooms
      hotel_current_occupancy << room.current_occupancy
    end
  end
##### I have not tested for this above yet. will need to fill lots of rooms in the test then ask what the occupancy is- make sure to put some single guests in double rooms in the test.


  def vacant_rooms
    ## room.current_guests.nil?
  end

  def occupied_rooms
    
  end


  def bill_total(guests, room)
    return (guests.days_booked*room.daily_rate)
  end

  def credit_hotel(credit)
    @revenue += credit
  end

  def debit_hotel(debit)
    @revenue -= debit
  end


### final_guests_checkout: works out bill, debits guests, credits hotel revenue, and checks guests out of room. The unless line is incase wrong(empty) room entered in error or incase someone tries to check out a guest that has already cheacked out- wont allow checkout of an empty room as this would erroneously charge guests.
def final_guests_checkout(guests, room)
  unless room.current_guests.nil?
    bill = bill_total(guests, room)
    guests.pay(bill)
    credit_hotel(bill)
    room.check_out
  end
end
### should there be some sort of error message if try to check out of empty room?









#### could get array of empty rooms and do .length on it to show how many rooms available

  # def occupied_rooms
  #   occupied_rooms = []
  #   for room in @all_rooms
  #     if room.current_guests.nil?
  #    end
  # end
#### blocks !!!?

## @all_rooms.inject(0){|room| room.current_guests.number_of_guests} ??
##### need another method !! to work out 'room_occupancy' (current no in room). this should also let you set a max limit of people per room, eg,room_occupancy cant > room_size. this might go in the check in function in rooms as an if statement.





  # def total_people_in_hotel    ### fire drill? 
  #   total_individual_guests = 0
  #   for room in @all_rooms
  #     if room.current_guests.nil?
  #   ##  'room.current_guests'  should be a method 'occupied_rooms' - could also make 'vacant_rooms'
  #     else
  #       total_individual_guests += room.current_guests.number_of_guests
  #     end
  #   end
  #   return total_individual_guests
  # end

####  split up in to more methods: are rooms full, empty



end