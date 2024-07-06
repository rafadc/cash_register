# frozen_string_literal: true

module Discounts
  # The repository to retrieve the discounts we have configured
  class DiscountRepository
    DISCOUNTS = [BuyOneGetOneFree.new].freeze

    def all
      DISCOUNTS
    end
  end
end
