require 'bank_account'

describe BankAccount do
  it 'initializes a new bank account instance' do
    expect(BankAccount.new).to be_an_instance_of(BankAccount)
  end

end
