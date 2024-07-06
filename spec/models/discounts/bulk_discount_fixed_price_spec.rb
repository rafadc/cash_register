# frozen_string_literal: true

RSpec.describe Discounts::BulkDiscountFixedPrice do
  subject(:discount) { described_class.new('SR1', 3, 4.5) }

  it 'does nothing when we have less than the required amount' do
    item = LineItem.new('SR1', 'Strawberries', 5.0, 2)
    expect(discount.apply([item])).to eq([item])
  end

  it 'changes the price when we have the required amount' do
    items = [LineItem.new('SR1', 'Strawberries', 5.0, 3)]
    items = discount.apply(items)
    expect(items.first.total_price).to eq(13.5)
  end

  it 'does not change the price for other items' do
    item = LineItem.new('CR1', 'Strawberries', 5.0, 4)
    expect(discount.apply([item])).to eq([item])
  end
end
