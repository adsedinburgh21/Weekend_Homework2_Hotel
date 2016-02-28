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
  #######
  #### could I use a blocks here ?? (above and below)
  #######
  def hotel_current_occupancy
    hotel_current_occupancy = 0
    for room in @all_rooms
      hotel_current_occupancy += room.current_occupancy
    end
    return hotel_current_occupancy
  end

  def list_vacant_rooms
    vacant_rooms = []
    for room in @all_rooms
      if room.current_guests.nil?
        vacant_rooms << room.name
      end
    end
    return vacant_rooms
  end

  def number_of_vacant_rooms
    list_vacant_rooms.length
  end

  def list_occupied_rooms
    occupied_rooms = []
    for room in @all_rooms
      occupied_rooms << room.name unless room.current_guests.nil?
    end
    return occupied_rooms
  end

  def number_of_occupied_rooms
    list_occupied_rooms.length
  end


  #### fire drill : return names of all guests (for room in rooms room.name_of_current guests) and rooms they are in, plus total number of guests in hotel

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

  ### should there be some sort of error message if try to check out of an empty/vacant room?
  #### Maybe this sort of thing should be in an end version called Hotel that runs everything. then I could put in user input in to say error etc ??

  def refund_guests(guests, refund_value)
    guests.refund(refund_value)
    debit_hotel(refund_value)
  end

  def what_room_are_guests_in(guests_name)
    for room in @all_rooms
      if room.name_of_current_guests == guests_name
        return room.name
      end
    end
  end

end