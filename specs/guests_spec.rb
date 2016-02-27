require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guests.rb' )


class GuestsTest < MiniTest::Test

  def setup
    @guests1 = Guests.new({name: "The Reids", number_of_guests: 2, money: 5000, days_booked: 7})
  end

  def test_guest_name
    assert_equal("The Reids", @guests1.name)
  end

  def test_number_of_guests
    assert_equal(2, @guests1.number_of_guests)
  end

  def test_guests_money
    assert_equal(5000, @guests1.money)
  end

  def test_number_of_days_booked
    assert_equal(7, @guests1.days_booked)
  end

  def test_pay
    @guests1.pay(800)
    assert_equal(4200, @guests1.money)
  end

  def test_refund
    @guests1.refund(678)
    assert_equal(5678, @guests1.money)
  end
end