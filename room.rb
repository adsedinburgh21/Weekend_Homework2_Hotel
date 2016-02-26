class Room

  attr_reader :name, :room_size, :daily_rate, :current_guests

  def initialize(params)
    @current_guests = []
    @name = params[:name]
    @room_size = params[:room_size]
    @daily_rate = params[:daily_rate]
  end

  def check_in(guests)
    @current_guests << guests
  end

  def check_out
    @current_guests = []
  end

end