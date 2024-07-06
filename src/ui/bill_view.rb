# frozen_string_literal: true

module Ui
  # Displays the total of the bill with details on every line item
  class BillView
    def initialize(bill:)
      @bill = bill
    end

    def render
      output = @bill.line_items.map do |line_item|
        item_description = "#{line_item.product_name}: #{line_item.quantity} x #{line_item.product_price}\n"
        item_description += "#{line_item.discounts.join(' ')} \n" if line_item.discounts.any?
        item_description + "\t\t= #{line_item.total_price.round(2)}"
      end.join("\n")
      output + "\n\n\tTOTAL: #{@bill.total.round(2)}"
    end
  end
end
