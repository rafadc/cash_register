# frozen_string_literal: true

RSpec.describe Discounts::BulkDiscountPercentage do
  subject(:discount) { described_class.new('GR1', 2, 50) }

  it 'does not apply any discount if the quantity is less than the minimum' do
    item = LineItem.new('GR1', 'Grapes', 3.11, 1)
    expect(discount.apply([item])).to eq([item])
  end

  it 'applies the discount if the quantity is equal to the minimum' do
    items = [LineItem.new('GR1', 'Grapes', 4.0, 2)]
    items = discount.apply(items)
    expect(items.first.total_price).to eq(4.0)
  end

  it 'does not apply the discount to other items' do
    item = LineItem.new('GR2', 'Other Grapes', 4.0, 2)
    expect(discount.apply([item])).to eq([item])
  end

  it 'applies the discount over the discounted price and not the total' do
    items = [LineItem.new('GR1', 'Grapes', 4.0, 2)]
    items = discount.apply(items)
    items = discount.apply(items)
    expect(items.first.total_price).to eq(2.0)
  end
end
