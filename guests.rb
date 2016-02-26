class Guests

  attr_reader :name, :money, :number_of_guests, :days_staying

  def initialize(params)
    @name = params[:name]
    @number_of_guests = params[:number_of_guests]
    @money = params[:money]
    @days_staying = params[:days_staying]
  end
  
end