# frozen_string_literal: true

require_relative '../cash_register'

require 'cli/ui'
require 'terminal-table'

product_repository = ProductRepository.new
shopping_cart = ShoppingCart.new(product_repository:)
bill_calculator = BillCalculator.new

running = true

while running
  system('clear')

  CLI::UI::StdoutRouter.enable
  puts Ui::ShoppingCartView.new(shopping_cart:, product_repository:).render

  bill = bill_calculator.calculate_for_cart(shopping_cart)
  puts Ui::BillView.new(bill:).render

  CLI::UI::Prompt.ask('add products to shopping cart') do |handler|
    product_repository.all.each do |product|
      handler.option("+1 #{product.name}") { |_| shopping_cart.add(product.id, 1) }
      handler.option("-1 #{product.name}") { |_| shopping_cart.remove(product.id, 1) }
    end
    handler.option('Checkout') { |_| running = false }
  end
end
