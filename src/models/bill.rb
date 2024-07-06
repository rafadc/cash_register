# frozen_string_literal: true

# The class that holds the total value of what the user will pay
class Bill
  attr_reader :line_items

  def initialize
    @line_items = []
  end

  def add_line_item(line_item)
    @line_items << line_item
  end

  def total
    @total = 0.0
    @line_items.each do |line_item|
      @total += line_item.total_price
    end
    @total
  end
end
