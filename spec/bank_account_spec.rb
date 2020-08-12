require 'bank_account'

describe BankAccount do
  subject(:account) { BankAccount.new }

  it 'initializes a new bank account instance' do
    expect(BankAccount.new).to be_an_instance_of(BankAccount)
  end

  it 'initializes a new bank account instance with an empty balance' do
    expect(account.balance).to eq(0)
  end

  describe '#deposit' do
    it 'user can deposit an amount into their bank account' do
      account.deposit(100.00)
      expect(account.balance).to eq(100.00)
    end

    it 'user can deposit more money and the total balance increases' do
      account.deposit(100.00)
      account. deposit(100.00)
      expect(account.balance).to eq(200.00)
    end
  end

  describe '#withdraw' do
    it 'user can withdraw money from their account' do
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'user cannot withdraw more money than they have' do
      account.deposit(100.00)
      account.withdraw(100.00)
      expect { account.withdraw(10.00) }.to raise_error('Not enough funds')
    end
  end

  describe '#print_statement' do
    it 'user can see their balance on the bank statement' do
      account.deposit(100.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:balance]}")
    end

    it 'user can see money depositing transactions' do
      account.deposit(100.00)
      expect(account.print_statement[0]).to include("#{account.bank_statement[0][:debit]}")
    end

    context 'user makes deposit and then withdraws' do
      before do
        account.deposit(100.00)
        account.withdraw(50.00)
      end

      it 'user can see money withdrawal transactions' do
        expect(account.print_statement[0]).to include("#{account.bank_statement[0][:credit]}")
      end

      it 'user can see the date on each transaction' do
        expect(account.print_statement[0]).to include("#{account.bank_statement[0][:date]}")
      end

      it 'user can see the transactions in a formatted table' do
        @todays_date = Time.now.strftime('%d/%m/%Y')
        allow(Time).to receive(:now).and_return(@todays_date)
        expect(account.print_statement).to eq("date  ||  credit  ||  debit  ||  balance\n#{@todays_date}  ||    ||  100.0  ||  100.0\n#{@todays_date}  ||  50.0  ||  100.0  ||  50.0")
      end
    end
  end
end
