require 'bank_account'
require 'statement'

describe 'printing statement' do
  subject(:account) { BankAccount.new }
  let(:print_fake_statement) do
    @todays_date = Time.now.strftime('%d/%m/%Y')
    "date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||    ||  0.15  ||  249.85 \n #{@todays_date}  ||    ||  750.00  ||  250.00 \n #{@todays_date}  ||  1000.00  ||    ||  1000.00"
  end

  it 'user can see their printed bank statement in formatted table' do
    statement = Statement.new
    account.deposit(1000)
    account.withdraw(750)
    account.withdraw(0.15)
    expect(account.print_statement(statement)).to eq(print_fake_statement)
  end
end
