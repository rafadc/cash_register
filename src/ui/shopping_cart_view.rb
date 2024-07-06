# frozen_string_literal: true

module Ui
  # Displays the shopping cart contents in the UI
  class ShoppingCartView
    def initialize(shopping_cart:, product_repository:)
      @shopping_cart = shopping_cart
      @product_repository = product_repository
    end

    def render
      @shopping_cart.items.map do |product_id, quantity|
        product = @product_repository.find(product_id)
        "#{product.name} x #{quantity}"
      end.join("\n")
    end
  end
end
