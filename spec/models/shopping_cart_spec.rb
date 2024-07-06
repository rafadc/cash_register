# frozen_string_literal: true

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new }

  describe '#add' do
    it 'adds an item to the cart' do
      cart.add('SR1', 1)

      expect(cart.items).to eq({ 'SR1' => 1 })
    end
  end
end
