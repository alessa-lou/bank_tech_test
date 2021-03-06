require 'statement'

describe Statement do
  subject(:statement) { Statement.new }
  let(:transactions) do
    @todays_date = Time.now.strftime('%d/%m/%Y')
    allow(Time).to receive(:now).and_return(@todays_date)
    [{ date: @todays_date, credit: '100.00', debit: '', balance: '100.00' }]
  end

  describe '#print_transactions' do
    let(:print_fake_transactions) do
      "#{@todays_date}  ||  100.00  ||    ||  100.00"
    end

    it 'prints the transaction history in a formatted way' do
      expect(statement.print_transactions(transactions)).to eq(print_fake_transactions)
    end
  end
end
