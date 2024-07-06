# frozen_string_literal: true

module Discounts
  # A bulk discount in fixed amount changes the price to the indicated
  # price when the amount of items purchased is equal or more to the
  # number of items indicated
  class BulkDiscountFixedPrice
    def initialize(product_id, quantity, price)
      @product_id = product_id
      @quantity = quantity
      @price = price
    end

    def apply(line_items)
      line_items.reduce([]) do |total, item|
        item.product_price = @price if item.quantity >= @quantity && item.product_id == @product_id

        total << item
      end
    end
  end
end
