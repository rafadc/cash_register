# frozen_string_literal: true

module Ui
  # Displays the total of the invoice with details on every line item
  class InvoiceView
    def initialize(invoice:)
      @invoice = invoice
    end

    def render
      @table = Terminal::Table.new
      @table.title = 'Invoice'
      @table.style = { border: :unicode_thick_edge }
      @invoice.line_items.each do |line_item|
        add_line_item_rows(line_item)
      end
      @table.add_row(['-----', '------'])
      @table.add_row(['', "TOTAL: #{@invoice.total.round(2)}"])
      @table.render
    end

    private

    def add_line_item_rows(line_item)
      @table.add_row([line_item.product_name, "#{line_item.quantity} units x #{line_item.product_price}"])
      @table.add_row(['', "        discount: #{line_item.discounts.join(' ')}"]) if line_item.discounts.any?
      @table.add_row(['', "        = #{line_item.total_price.round(2)}"])
    end
  end
end
