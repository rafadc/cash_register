# frozen_string_literal: true

RSpec.describe TotalCalculator do
  context 'when we have no discounts' do
    describe '#total' do
      let(:shopping_cart) { ShoppingCart.new }

      it 'returns the total amount for an empty register' do
        total_calculator = described_class.new(shopping_cart)
        expect(total_calculator.total).to eq(0.0)
      end

      it 'calculates the total amount for a single item' do
        shopping_cart.add('GR1', 1)

        total_calculator = described_class.new(shopping_cart)
        expect(total_calculator.total).to eq(3.11)
      end

      it 'calculates the total amount when we have more than one item of the same type' do
        shopping_cart.add('GR1', 2)

        total_calculator = described_class.new(shopping_cart)
        expect(total_calculator.total).to eq(6.22)
      end

      it 'calculates the total with more than one kind of item' do
        shopping_cart.add('GR1', 1)
        shopping_cart.add('SR1', 1)

        total_calculator = described_class.new(shopping_cart)
        expect(total_calculator.total).to eq(8.11)
      end
    end
  end
end
