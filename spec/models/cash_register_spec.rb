# frozen_string_literal: true

RSpec.describe CashRegister do
  let(:cash_register) { described_class.new }

  describe '#total' do
    it 'returns the total amount of the items' do
      cash_register.add('GR1', 1)
      expect(cash_register.total).to eq(1.00)
    end

    it 'calculates the total amount when we have more than one item of the same type' do
      cash_register.add('GR1', 2)
      expect(cash_register.total).to eq(2.00)
    end
  end
end
