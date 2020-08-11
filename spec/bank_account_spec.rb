require 'bank_account'

describe BankAccount do
  it 'initializes a new bank account instance' do
    expect(BankAccount.new).to be_an_instance_of(BankAccount)
  end

  it 'initializes a new bank account instance with an empty balance' do
    account = BankAccount.new
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    it 'user can deposit an amount into their bank account' do
      account = BankAccount.new
      account.deposit(100.00)
      expect(account.balance).to eq(100.00)
    end

    it 'user can deposit more money and the total balance increases' do
      account = BankAccount.new
      account.deposit(100.00)
      account. deposit(100.00)
      expect(account.balance).to eq(200.00)
    end
  end

  describe '#withdraw' do
    it 'user can withdraw money from their account' do
      account = BankAccount.new
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'user cannot withdraw more money than they have' do
      account = BankAccount.new
      account.deposit(100.00)
      account.withdraw(100.00)
      expect{account.withdraw(10.00)}.to raise_error("You have no funds left")
    end
  end

  describe '#print_statement' do
    it 'user can see their balance on the bank statement' do
      account = BankAccount.new
      account.deposit(100.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:balance]}")
    end

    it 'user can see money depositing transactions' do
      account = BankAccount.new
      account.deposit(100.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:debit]}")
    end

    it 'user can see money withdrawal transactions' do
      account = BankAccount.new
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:credit]}")
    end

    it 'user can see the date on each transaction' do
      account = BankAccount.new
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:date]}")
    end
  end

end
