class Discounter
  def calculate_discount(sku:, quantity:)
    discount_amount = 0

    case sku
    when 123
      discount_amount = 200 * (quantity/3).floor
    when 456
      discount_amount = 50 * quantity
    end

    discount_amount
  end
end