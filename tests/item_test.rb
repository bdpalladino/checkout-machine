require 'minitest/autorun'
require_relative '../checkout_machine'
require_relative '../item'
require_relative '../taxable'

class ItemTest < Minitest::Test
  def setup
  	# Arrange & Act
    @item = Item.new(sku: 123, price: 200) # chips
  end

  def test_order_returns_chip_sku
  	# Assert
    assert_equal 123, @item.sku
  end

  def test_item_returns_chip_price
  	# Assert
    assert_equal 200, @item.price
  end

  def test_chips_are_not_taxable
  	# Assert
  	assert_equal false, @item.is_taxable?
  end

  def test_wine_is_taxable
  	# Arrange & Act
  	@wine = Item.new(sku: 1000, price: 1500)
  	# Assert
  	assert_equal true, @wine.is_taxable?
  end
end