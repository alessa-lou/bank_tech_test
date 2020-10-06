require 'statement'
require 'bank_account'

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

    # let(:statement_double) do double :statement
    #   allow(statement_double).to receive(:print_transactions).and_return("date  ||  credit  ||  debit  ||  balance \n 05/10/2020  ||  100.00  ||    ||  100.00")
    #  end

    it 'prints the transaction history in a formatted way' do
      expect(statement.print_transactions(transactions)).to eq(print_fake_transactions)
    end
  end
end
