class Room

  attr_reader :name, :room_size, :daily_rate, :current_guests, :is_room_in_use

  def initialize(params)
    @current_guests = []
    @name = params[:name]
    @room_size = params[:room_size]
    @daily_rate = params[:daily_rate]
    is_room_in_use = false
  end

  def check_in(guests)
    @current_guests << guests
    is_room_in_use = true
  end

  def check_out
    @current_guests = []
    is_room_in_use = false
  end
    
  def length
    return 
  end

end