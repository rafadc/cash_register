# frozen_string_literal: true

# This class is responsible for calculating the total amount of the shopping shopping_cart
# It handles all the complexity of applying discounts and managing the items
class TotalCalculator
  def initialize(shopping_cart)
    @items = shopping_cart.line_items
  end

  def total
    @total = 0.0
    @items.each do |line_item|
      price = ProductRepository.new.find(line_item.product_id).price
      @total += line_item.quantity * price
    end
    @total
  end
end
