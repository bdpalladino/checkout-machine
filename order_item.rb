# Data and behaviors related to items sold in the store

# No longer need this class. created to demonstrate ch6 inheritance 
# principles - but logic has been moved to Order class so can just
# use regular Item class.

class OrderItem < Item
  attr_accessor :quantity

  # The wrong way to extend super class constructor logic (p132-134):
  # def initialize(args)
  # 	super(args) # note: 
  #   @count = 0
  # end
  
  def add_to_order(add_qty=0)
  	@quantity += add_qty
  end

  def remove_from_order(rem_qty=0)
    if rem_qty > @quantity
      @quantity = 0
    else
      @quantity -= rem_qty
    end
  end

  # The right way to extend super class constructor logic (p134-135):
  # override method from the super that is called in super constructor
  def post_initialize
    @quantity = 0
  end
end