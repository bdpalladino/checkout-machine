# Data and behaviors related to items sold in the store
class OrderItem < Item
  attr_accessor :count

  # The wrong way to add to super class constructor logic (p132-134):
  # def initialize(args)
  # 	super(args) # note: 
  #   @count = 0
  # end
  
  def add_to_order(add_qty=0)
  	@count += add_qty
  end

  def remove_from_order(rem_qty=0)
    if rem_qty > @count
      @count = 0
    else
      @count -= rem_qty
    end
  end

  # The right way to add to super class constructor logic (p134-135):
  # override method from the super that is called in super constructor
  def post_initialize
    @count = 0
  end
end