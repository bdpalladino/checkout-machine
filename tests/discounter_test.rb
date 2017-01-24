require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../discounter'

class DiscounterTest < Minitest::Test
  def setup
    @discounter = Discounter.new
  end

  def test_order_returns_chip_discount
    assert_equal 600, @discounter.calculate_discount(sku: 123, quantity: 9)
  end

  def test_item_returns_salsa_discount
    assert_equal 250, @discounter.calculate_discount(sku: 456, quantity: 5)
  end
end