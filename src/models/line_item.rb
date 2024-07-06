# frozen_string_literal: true

# A line item represents each of the items that we will use to bill a
# customer. It needs to consider and note every potential discount since
# it will be displayed in the final bill.
class LineItem
  attr_reader :product_id, :product_name
  attr_accessor :quantity, :product_price, :discounts

  def initialize(product_id, product_name, product_price, quantity)
    @product_id = product_id
    @product_name = product_name
    @product_price = product_price
    @quantity = quantity
    @discounts = []
  end

  def apply_discount(percentage)
    @discounts << percentage
  end

  def total_price
    total = product_price * quantity
    @discounts.each do |discount|
      total -= total * (discount / 100.0)
    end
    total
  end
end
