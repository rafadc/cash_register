# frozen_string_literal: true

RSpec.describe TotalCalculator do
  let(:discount_repository) { instance_double(Discounts::DiscountRepository) }
  let(:shopping_cart) { ShoppingCart.new }

  subject(:total_calculator) { described_class.new(shopping_cart, discount_repository: ) }

  context 'when we have no discounts' do
    before do
      allow(discount_repository).to receive(:all).and_return([])
    end

    describe '#total' do
      it 'returns the total amount for an empty register' do
        expect(total_calculator.total).to eq(0.0)
      end

      it 'calculates the total amount for a single item' do
        shopping_cart.add('GR1', 1)

        expect(total_calculator.total).to eq(3.11)
      end

      it 'calculates the total amount when we have more than one item of the same type' do
        shopping_cart.add('GR1', 2)

        expect(total_calculator.total).to eq(6.22)
      end

      it 'calculates the total with more than one kind of item' do
        shopping_cart.add('GR1', 1)
        shopping_cart.add('SR1', 1)

        expect(total_calculator.total).to eq(8.11)
      end
    end
  end

  context 'when we have discounts' do
    before do
      allow(discount_repository).to receive(:all).and_return([Discounts::BuyOneGetOneFree.new])
    end

    it 'applies the discount to the items' do
      shopping_cart.add('GR1', 2)

      expect(total_calculator.total).to eq(3.11)
    end
  end
end
