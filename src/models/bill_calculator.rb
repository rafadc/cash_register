# frozen_string_literal: true

# This class is responsible for calculating the total amount of the shopping shopping_cart
# It handles all the complexity of applying discounts and managing the items
class BillCalculator
  def initialize(product_repository: ProductRepository.new,
                 discount_repository: Discounts::DiscountRepository.new)
    @product_repository = product_repository
    @discount_repository = discount_repository
  end

  def calculate_for_cart(shopping_cart)
    bill = Bill.new
    discounted_line_items(shopping_cart).each do |line_item|
      bill.add_line_item(line_item)
    end
    bill
  end

  private

  def line_items(shopping_cart)
    shopping_cart.items.map do |product_id, quantity|
      product = @product_repository.find(product_id)
      LineItem.new(product_id, product.name, product.price, quantity)
    end
  end

  def discounted_line_items(shopping_cart)
    items_with_discount = line_items(shopping_cart)
    @discount_repository.all.each do |discount|
      items_with_discount = discount.apply(items_with_discount)
    end
    items_with_discount
  end
end
