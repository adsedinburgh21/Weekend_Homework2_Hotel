require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guests.rb' )


class GuestsTest < MiniTest::Test

  def setup
    @guest1 = Guests.new({name: "The Reids", number_of_guests: 2, money: 5000, days_staying: 7})
  end

  def test_guest_name
    assert_equal("The Reids", @guest1.name)
  end

  def test_number_of_guests
    assert_equal(2, @guest1.number_of_guests)
  end

  def test_guests_money
    assert_equal(5000, @guest1.money)
  end

  def test_number_of_days_staying
    assert_equal(7, @guest1.days_staying)
  end

end