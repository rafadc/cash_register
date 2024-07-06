# frozen_string_literal: true

RSpec.describe Discounts::BulkDiscountPercentage do
  subject(:discount) { described_class.new('GR1', 2, 10) }

  it 'does not apply any discount if the quantity is less than the minimum' do
    item = LineItem.new('GR1', 'Grapes', 3.11, 1, 0.0)
    expect(discount.apply([item])).to eq([item])
  end
end
