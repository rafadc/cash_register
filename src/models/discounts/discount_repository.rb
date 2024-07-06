# frozen_string_literal: true

module Discounts
  # The repository to retrieve the discounts we have configured
  class DiscountRepository
    def all
      discounts
    end

    private

    def discounts
      @discounts ||= read_discounts_from_config
    end

    def read_discounts_from_config
      @discounts = YAML.load_file('src/configuration.yml')['discounts']
      @discounts.map do |discount|
        case discount['type']
        when 'buy-one-get-one-free'
          BuyOneGetOneFree.new(discount['code'])
        when 'bulk-discount-fixed-price'
          BulkDiscountFixedPrice.new(discount['code'], discount['min_quantity'], discount['discount_price'])
        when 'bulk-discount-percentage'
          BulkDiscountPercentage.new(discount['code'], discount['min_quantity'], discount['discount_percentage'])
        end
      end
    end
  end
end
