# frozen_string_literal: true

RSpec.describe Discounts::BuyOneGetOneFree do
  subject(:discount) { described_class.new('GR1') }

  it 'does nothing when just one item' do
    item = LineItem.new('GR1', 'Grapes', 3.11, 1)
    expect(discount.apply([item])).to eq([item])
  end

  it 'makes one of the items free when we have two' do
    items = [LineItem.new('GR1', 'Grapes', 3.11, 2)]
    items = discount.apply(items)
    expect(items.map(&:total_price)).to eq([3.11, 0.0])
  end

  it 'ignores the discount for other items' do
    item = LineItem.new('GR2', 'non discountable Grapes', 3.11, 2)
    expect(discount.apply([item])).to eq([item])
  end
end
