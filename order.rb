# data and behaviors related to the order checkout machine is currently processing
class Order
  attr_accessor :balance, :bonus_card_scanned, :order_items

  def initialize
    @balance = 0
    @bonus_card_scanned = false
    @discounter = Discounter.new
    @order_items = {}         # hash to store items on order & count
    @order_items.default = 0  # default count returned if item is not on order
  end

  def add_scanned_item(item)
    if item.sku == 000
      @bonus_card_scanned = true
    else
      update_counts(item.sku)
    end

    @balance += item.price 
  end

  def total
    apply_discount if @bonus_card_scanned
    @balance
  end

  private

  def apply_discount
    @order_items.each { |sku, qty| @balance -= @discounter.calculate_discount(sku: sku.to_s.to_sym, quantity: qty) }
  end

  def update_counts(sku)
    @order_items[sku.to_s.to_sym] += 1
  end
end