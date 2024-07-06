# frozen_string_literal: true

# The class that represents our shopping cart
# Its purpose is to keep track of the items that we are buying
# and turn those into line items that we can use to calculate the total
class ShoppingCart
  attr_reader :items

  def initialize(product_repository: ProductRepository.new)
    @items = Hash.new(0)
    @product_repository = product_repository
  end

  def add(product_id, quantity)
    @items[product_id] += quantity
  end

  def remove(product_id, quantity)
    @items[product_id] -= quantity
    @items.delete(product_id) if @items[product_id] <= 0
  end
end
