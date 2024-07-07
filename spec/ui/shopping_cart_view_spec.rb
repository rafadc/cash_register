# frozen_string_literal: true

RSpec.describe Ui::ShoppingCartView do
  subject(:shopping_cart_view) do
    described_class.new(shopping_cart:, product_repository:)
  end

  let(:shopping_cart) { instance_double(ShoppingCart, items: { 1 => 1 }) }
  let(:product_repository) { instance_double(ProductRepository, find: product) }
  let(:product) { instance_double(Product, name: 'Green Tea') }

  describe '#render' do
    it 'shows the product name' do
      expect(shopping_cart_view.render).to include('Green Tea')
    end

    it 'shows the quantity' do
      expect(shopping_cart_view.render).to include('1')
    end
  end
end
