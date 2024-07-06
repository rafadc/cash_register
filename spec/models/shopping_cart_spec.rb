# frozen_string_literal: true

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new }

  describe '#add' do
    it 'adds an item to the cart' do
      cart.add('SR1', 1)

      first_item = cart.line_items.first
      expect(first_item.product_id).to eq('SR1')
      expect(first_item.quantity).to eq(1)
      expect(first_item.product_price).to eq(5.0)
    end
  end
end
