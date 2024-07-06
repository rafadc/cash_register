# frozen_string_literal: true

# The class that represents our shopping cart
# Its purpose is to keep track of the items that we are buying
# and turn those into line items that we can use to calculate the total
class ShoppingCart
  def initialize(product_repository: ProductRepository.new)
    @items = Hash.new(0)
    @product_repository = product_repository
  end

  def add(product_id, quantity)
    @items[product_id] += quantity
  end

  def line_items
    @items.map do |product_id, quantity|
      product = @product_repository.find(product_id)
      LineItem.new(product_id, product.name, product.price, quantity, 0.0)
    end
  end
end
