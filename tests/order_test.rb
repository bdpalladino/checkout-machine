require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../item'
require_relative '../order'

class OrderTest < Minitest::Test
  def setup
    @order = Order.new
    @chips = Item.new({:sku => 123, :price => 200 })
    @salsa = Item.new({:sku => 456, :price => 100 })
    @bonus_card = Item.new({:sku => 000, :price => 0 })
  end

  def test_order_add_scanned_item_updates_order
    @order.add_scanned_item(@chips)
    assert_equal @order.balance, 200
    assert_equal @order.chip_counter, 1
  end

  def test_order_total_returns_expected_total_without_bonus_card
    @order.add_scanned_item(@chips)
    @order.add_scanned_item(@salsa)
    assert_equal @order.total, 300
  end

  def test_order_total_returns_expected_total_with_bonus_card
    @order.add_scanned_item(@chips)
    @order.add_scanned_item(@salsa)
    @order.add_scanned_item(@bonus_card)
    assert_equal @order.total, 250
  end
end