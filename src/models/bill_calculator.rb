# frozen_string_literal: true

# This class is responsible for calculating the total amount of the shopping shopping_cart
# It handles all the complexity of applying discounts and managing the items
class BillCalculator
  def initialize(shopping_cart,
                 product_repository: ProductRepository.new,
                 discount_repository: Discounts::DiscountRepository.new)
    @items = shopping_cart.line_items
    @product_repository = product_repository
    @discount_repository = discount_repository
  end

  def discounted_line_items
    items_with_discount = @items.dup
    @discount_repository.all.each do |discount|
      @discounted_line_items = discount.apply(items_with_discount)
    end
    items_with_discount
  end

  def total
    @total = 0.0
    discounted_line_items.each do |line_item|
      @total += line_item.total_price
    end
    @total
  end
end
