# frozen_string_literal: true

# The class that represents our cash register
class CashRegister
  def initialize
    @items = Hash.new(0)
  end

  def add(item, quantity)
    @items[item] += quantity
  end

  def total
    @total = 0.0
    @items.each do |_item, quantity|
      @total += quantity
    end
    @total
  end
end
