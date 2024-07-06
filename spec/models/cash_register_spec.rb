# frozen_string_literal: true

RSpec.describe CashRegister do
  let(:cash_register) { described_class.new }

  describe '#total' do
    it 'returns the total amount of the items' do
      cash_register.add('GR1', 1)
      expect(cash_register.total).to eq(3.11)
    end

    it 'calculates the total amount when we have more than one item of the same type' do
      cash_register.add('GR1', 2)
      expect(cash_register.total).to eq(6.22)
    end

    it 'calculates the total with more than one kind of item' do
      cash_register.add('GR1', 1)
      cash_register.add('SR1', 1)
      expect(cash_register.total).to eq(8.11)
    end
  end
end
