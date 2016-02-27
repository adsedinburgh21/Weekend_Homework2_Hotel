class Guests

  attr_reader :name, :number_of_guests, :money, :days_booked


  def initialize(params)
    @name = params[:name]
    @number_of_guests = params[:number_of_guests]
    @money = params[:money]
    @days_booked = params[:days_booked]
  end


  def pay(debit)
    @money -= debit
  end

  def refund(credit)
    @money += credit
  end

end