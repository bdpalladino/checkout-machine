require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../item'
require_relative '../order_item'

class OrderItemTest < Minitest::Test
  def setup
    # Arrange & Act
    @order_item = OrderItem.new({:sku => 123, :price => 200 })
  end

  def test_initial_count_is_zero
  	# Assert
  	assert_equal 0, @order_item.count
  end

  def test_add_to_order_increases_count
  	# Act
  	@order_item.add_to_order(10)
  	# Assert
  	assert_equal 10, @order_item.count
  end

  def test_remove_from_order_decreases_count
  	# Arrange
  	@order_item.add_to_order(10)
  	# Act
  	@order_item.remove_from_order(5)
  	# Assert
  	assert_equal 5, @order_item.count
  end

  def test_remove_from_order_sets_count_to_zero_if_removal_qty_exceeds_count
  	# Arrange
  	@order_item.add_to_order(10)
  	# Act
  	@order_item.remove_from_order(15)
  	# Assert
  	assert_equal 0, @order_item.count
  end
end