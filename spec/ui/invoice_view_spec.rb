# frozen_string_literal: true

RSpec.describe Ui::InvoiceView do
  subject(:invoice_view) { described_class.new(invoice:) }

  let(:invoice) { instance_double(Invoice, line_items: [line_item], total: 3.11) }
  let(:line_item) do
    instance_double(LineItem, product_name: 'Green Tea', quantity: 1, product_price: 3.11, discounts: [], total_price: 3.11)
  end

  describe '#render' do
    it 'shows the total amount' do
      expect(invoice_view.render).to include('TOTAL: 3.11')
    end

    it 'shows the product name' do
      expect(invoice_view.render).to include('Green Tea')
    end
  end
end
