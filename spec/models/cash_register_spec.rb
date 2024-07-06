# frozen_string_literal: true

RSpec.describe CashRegister do
  describe '#total' do
    it 'returns the total amount of the items' do
      cash_register = described_class.new
      cash_register.add('GR1', 1)
      expect(cash_register.total).to eq(1.00)
    end
  end
end
