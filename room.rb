class Room

  attr_reader :name, :room_size, :daily_rate, :current_guests

  def initialize(params)
    @current_guests = nil
    @name = params[:name]
    @room_size = params[:room_size]
    @daily_rate = params[:daily_rate]
  end

  
  def check_in(guests)
    if current_guests.nil?
      @current_guests = guests #unless 'is_room_too_small' == true
    end
  end
  #### do i need to output anything to say the check in wasnt successful if room is already occupied (or is too small)?
  
  def check_out
    @current_guests = nil
  end
    
  def current_occupancy
    @current_guests.nil? ? 0 : @current_guests.number_of_guests 
  end
  #### if current guests are nil then return 0 else return no of people in room

  #### set so that guests.number_of_guests cant be more than the size of the room. mbe make a 'is_room_too_small' method that is set to false and true if guests.number_of_guests > room.room_size. then add an unless to check_in saying unless is_room_too_small == true.


end