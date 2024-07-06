# frozen_string_literal: true

# The class that represents our shopping cart
# Its purpose is to keep track of the items that we are buying
# and turn those into line items that we can use to calculate the total
class ShoppingCart
  def initialize
    @items = Hash.new(0)
  end

  def add(product_id, quantity)
    @items[product_id] += quantity
  end

  def line_items
    @items.map do |product_id, quantity|
      LineItem.new(product_id, quantity, 0.0)
    end
  end
end
