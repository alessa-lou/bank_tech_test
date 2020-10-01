require 'bank_account'
require 'statement'

describe 'printing statement' do

  subject(:account) { BankAccount.new }
  let(:print_statement) do
    @todays_date = Time.now.strftime('%d/%m/%Y')
    "date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||    ||  0.15  ||  249.85 \n #{@todays_date}  ||    ||  750.0  ||  250.0 \n #{@todays_date}  ||  1000.0  ||    ||  1000.0"
  end
    
  it 'user can see their printed bank statement in formatted table' do
    account.deposit(1000.00)
    account.withdraw(750.00)
    account.withdraw(0.15)
    expect(account.print_statement).to eq(print_statement)
  end
end
