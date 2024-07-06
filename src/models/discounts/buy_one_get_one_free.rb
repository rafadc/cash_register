# frozen_string_literal: true

module Discounts
  # A discount that makes one of the items free if you already have one
  # of the same kind. This is not the same as a 50% discount, since
  # the free items will not count towards bulk discounts if this
  # has more precedence than other discount.
  class BuyOneGetOneFree
    def apply(items)
      items.reduce([]) do |total, item|
        if item.quantity >= 2
          original_quantity = item.quantity
          item.quantity = (item.quantity / 2) + (item.quantity % 2)
          total << item
          total << LineItem.new(item.product_id, item.product_name, 0.0, original_quantity / 2, item.discount)
        else
          total << item
        end
      end
    end
  end
end
