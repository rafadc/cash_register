# frozen_string_literal: true

module Discounts
  # The repository to retrieve the discounts we have configured
  class DiscountRepository
    DISCOUNTS = [
      BuyOneGetOneFree.new('GR1'),
      BulkDiscountFixedPrice.new('SR1', 3, 4.50)
    ].freeze

    def all
      DISCOUNTS
    end
  end
end
