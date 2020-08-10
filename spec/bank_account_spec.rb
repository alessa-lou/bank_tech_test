require 'bank_account'

describe BankAccount do
  it 'initializes a new bank account instance' do
    expect(BankAccount.new).to be_an_instance_of(BankAccount)
  end

  it 'initializes a new bank account instance with an empty balance' do
    account = BankAccount.new
    expect(account.balance).to eq([])
  end

  describe '#deposit' do
    it 'user can deposit an amount into their bank account' do
      account = BankAccount.new
      account.deposit(100.00)
      expect(account.balance[0]).to eq(100.00)
    end
  end

end