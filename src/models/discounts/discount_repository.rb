# frozen_string_literal: true

module Discounts
  # The repository to retrieve the discounts we have configured
  class DiscountRepository
    DISCOUNTS = [BuyOneGetOneFree.new('GR1')].freeze

    def all
      DISCOUNTS
    end
  end
end
