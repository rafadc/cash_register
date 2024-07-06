# frozen_string_literal: true

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new }

  describe '#add' do
    it 'adds an item to the cart' do
      cart.add('SR1', 1)
      expect(cart.line_items).to eq([LineItem.new('SR1', 1, 0.0)])
    end
  end
end
