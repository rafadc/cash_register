# frozen_string_literal: true

RSpec.describe ShoppingCart do
  let(:cart) { described_class.new }

  describe '#add' do
    it 'adds an item to the cart' do
      cart.add('SR1', 1)

      expect(cart.items).to eq({ 'SR1' => 1 })
    end

    it 'removes an item from the cart' do
      cart.add('SR1', 2)
      cart.remove('SR1', 1)

      expect(cart.items).to eq({ 'SR1' => 1 })
    end

    it 'removes completely the item if none left' do
      cart.add('SR1', 2)
      cart.remove('SR1', 2)

      expect(cart.items).to eq({})
    end

    it 'does not remove an item from the cart if the quantity is 0' do
      cart.add('SR1', 1)
      cart.remove('SR1', 2)

      expect(cart.items).to eq({})
    end
  end
end
