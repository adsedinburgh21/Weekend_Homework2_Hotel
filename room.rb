class Room

  attr_reader :name, :room_size, :daily_rate, :current_guests

  def initialize(params)
    @current_guests = nil
    @over_capacity = nil
    @name = params[:name]
    @room_size = params[:room_size]
    @daily_rate = params[:daily_rate]
  end

  def is_room_too_small(guests)
    @over_capacity = guests.number_of_guests > room_size ? true : nil
  end
  
  def check_in(guests)
    is_room_too_small(guests)
    if @current_guests.nil? && @over_capacity.nil?
      @current_guests = guests
    end
  end
  #### do i need to output anything to say the check_in wasnt successful if room is already occupied or is too small?
  
  def check_out
    @current_guests = nil
  end
  
  def name_of_current_guests
    @current_guests.name unless @current_guests.nil?
  end

  def days_booked
    @current_guests.nil? ? 0 : @current_guests.days_booked
  end

  def current_occupancy
    @current_guests.nil? ? 0 : @current_guests.number_of_guests 
  end
  #### above means: if current guests == nil then return 0 else return no.of people in room



end