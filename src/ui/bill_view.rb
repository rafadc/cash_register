# frozen_string_literal: true

module Ui
  # Displays the total of the bill with details on every line item
  class BillView
    def initialize(bill:)
      @bill = bill
    end

    def render
      @table = Terminal::Table.new
      @table.title = 'Invoice'
      @table.style = { border: :unicode_thick_edge }
      @bill.line_items.each do |line_item|
        @table.add_row([line_item.product_name, "#{line_item.quantity} units x #{line_item.product_price}"])
        @table.add_row(['', "        discount: #{line_item.discounts.join(' ')}"]) if line_item.discounts.any?
        @table.add_row(['', "        = #{line_item.total_price.round(2)}"])
      end
      @table.add_row(['-----', '------'])
      @table.add_row(['', "TOTAL: #{@bill.total.round(2)}"])
      @table.render
    end
  end
end
