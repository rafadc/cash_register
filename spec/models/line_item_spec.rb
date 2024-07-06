# frozen_string_literal: true

RSpec.describe LineItem do
  subject(:line_item) { described_class.new('SR1', 'Strawberries', 1.0, 4) }

  describe '#total_price' do
    it 'returns the total price for the line item' do
      expect(line_item.total_price).to eq(4.0)
    end

    it 'applies discounts to the total price' do
      line_item.apply_discount_percentage(50)
      expect(line_item.total_price).to eq(2.0)
    end
  end
end
