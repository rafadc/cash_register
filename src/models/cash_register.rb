# frozen_string_literal: true

# The class that represents our cash register
class CashRegister
  def initialize
    @items = Hash.new(0)
  end

  def add(product_id, quantity)
    @items[product_id] += quantity
  end

  def total
    @total = 0.0
    @items.each do |product_id, quantity|
      price = ProductRepository.new.find(product_id).price
      @total += quantity * price
    end
    @total
  end
end
