# frozen_string_literal: true

module Discounts
  # This class discounts the price of a product a given percentage if we
  # buy more or equal than a certain quantity
  class BulkDiscountPercentage
    def initialize(product_id, quantity, percentage)
      @product_id = product_id
      @quantity = quantity
      @percentage = percentage
    end

    def apply(line_items)
      line_items
    end
  end
end
