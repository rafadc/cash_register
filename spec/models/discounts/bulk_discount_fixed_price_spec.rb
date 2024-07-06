# frozen_string_literal: true

RSpec.describe Discounts::BulkDiscountFixedPrice do
  subject(:discount) { described_class.new('SR1', 3, 4.5) }

  it 'does nothing when we have less than the required amount' do
    item = LineItem.new('SR1', 'Strawberries', 5.0, 2, 0.0)
    expect(discount.apply([item])).to eq([item])
  end

  it 'changes the price when we have the required amount' do
    item = LineItem.new('SR1', 'Strawberries', 5.0, 3, 0.0)
    expect(discount.apply([item])).to eq([LineItem.new('SR1', 'Strawberries', 4.5, 3, 0.0)])
  end

  it 'does not change the price for other items' do
    item = LineItem.new('CR1', 'Strawberries', 5.0, 4, 0.0)
    expect(discount.apply([item])).to eq([item])
  end
end
