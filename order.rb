# data and behaviors related to the order checkout machine is currently processing
class Order
  attr_accessor :balance, :bonus_card_scanned, :salsa_counter, :chip_counter

  def initialize
    @balance = 0
    @bonus_card_scanned = false
    @salsa_counter = 0
    @chip_counter = 0
    @discounter = Discounter.new
  end

  def add_scanned_item(item)
    if item.sku == 123
      @chip_counter += 1
    elsif item.sku == 456
      @salsa_counter += 1
    elsif item.sku == 000
      @bonus_card_scanned = true
    end

    @balance += item.price
  end

  def total
    apply_discount
    @balance
  end

  private

  def apply_discount
    if @bonus_card_scanned
      @balance -= @discounter.calculate_discount(sku: 123, quantity: @chip_counter)
      @balance -= @discounter.calculate_discount(sku: 456, quantity: @salsa_counter)
    end
  end
end