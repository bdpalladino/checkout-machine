module Taxable
  def is_taxable?
    is_taxable_item?(@sku)
  end

  private

  def is_taxable_item?(sku)
    taxable_items.include?(sku)
  end

  def taxable_items
    [ 1000, 111 ] # wine, cigarettes
  end
end