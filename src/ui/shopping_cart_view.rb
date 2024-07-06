# frozen_string_literal: true

module Ui
  # Displays the shopping cart contents in the UI
  class ShoppingCartView
    def initialize(shopping_cart:, product_repository:)
      @shopping_cart = shopping_cart
      @product_repository = product_repository
    end

    def render
      @table = Terminal::Table.new
      @table.title = 'ShoppingCart'
      @table.headings = %w[Product Quantity]
      @table.style = { border: :unicode_thick_edge }
      @shopping_cart.items.map do |product_id, quantity|
        product = @product_repository.find(product_id)
        @table.add_row([product.name, quantity])
      end
      @table.render
    end
  end
end
