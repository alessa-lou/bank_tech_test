
describe 'printing statement' do
  it 'user can see their printed bank statement in formatted table' do
    account = BankAccount.new

    account.deposit(1000.00)
    account.withdraw(750.00)
    account.withdraw(0.15)
    expect(account.print_statement).to eq("date  ||  credit  ||  debit  ||  balance \n 16/08/2020  ||    ||  0.15  ||  249.85 \n 16/08/2020  ||    ||  750.0  ||  250.0 \n 16/08/2020  ||  1000.0  ||    ||  1000.0")
  end
end
