# frozen_string_literal: true

RSpec.describe Invoice do
  subject(:invoice) { described_class.new }

  let(:line_item) { instance_double(LineItem, total_price: 3.11) }

  describe '#add_line_item' do
    it 'adds a new line item' do
      invoice.add_line_item(line_item)

      expect(invoice.line_items).to contain_exactly(line_item)
    end
  end

  describe '#total' do
    it 'returns the total amount of the invoice' do
      invoice.add_line_item(line_item)
      invoice.add_line_item(line_item)

      expect(invoice.total).to eq(6.22)
    end
  end
end
