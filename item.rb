require './taxable'

# Data and behaviors related to items sold in the store
class Item
  include Taxable
  attr_accessor :sku, :price
  
	def initialize(args)
    @sku = args[:sku]
    @price = args[:price] || 0
    post_initialize
  end

  # Added so extra constructor logic can be used by sub classes
  def post_initialize
    nil
  end
end