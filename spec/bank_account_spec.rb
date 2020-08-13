require 'bank_account'

describe BankAccount do
  subject(:account) { BankAccount.new }

  describe '#deposit' do
    it 'user can deposit an amount into their bank account' do
      account.deposit(100.00)
      expect(account.balance).to eq(100.00)
    end

    it 'user cannot deposit zero, or a negative amount of money' do
      expect { account.deposit(-10.34) }.to raise_error('Cannot deposit a negative amount')
    end

    it 'user can deposit more money and the total balance increases' do
      account.deposit(100.00)
      account.deposit(100.00)
      expect(account.balance).to eq(200.00)
    end

    it 'user can make a deposit several times in a row' do
      account.deposit(0.52)
      account.deposit(75.15)
      account.deposit(91.53)
      account.deposit(3.47)
      expect(account.balance).to eq(170.67)
    end
  end

  describe '#withdraw' do
    it 'user can withdraw money from their account' do
      account.deposit(100.00)
      account.withdraw(50.00)
      expect(account.balance).to eq(50.00)
    end

    it 'user can withdraw more than once in a row' do
      account.deposit(100.00)
      account.withdraw(43.76)
      account.withdraw(6.24)
      account.withdraw(15.15)
      expect(account.balance).to eq(34.85)
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
      account.deposit(53.47)
      expect(account.print_statement).to include('153.47')
    end

    it 'user can see money deposited transactions' do
      account.deposit(100.00)
      account.deposit(45.69)
      expect(account.print_statement).to include('45.69')
      expect(account.balance).to eq(145.69)
    end

    context 'user makes deposit and then withdraws' do
      before do
        account.deposit(100.00)
        account.withdraw(50.00)
      end

      it 'user can see money withdrawal transactions' do
        account.withdraw(15.35)
        expect(account.print_statement).to include('15.35')
      end

      it 'user can see the date on each transaction' do
        expect(account.print_statement).to include('13/08/2020')
      end

      it 'user can see the transactions in a formatted table' do
        @todays_date = Time.now.strftime('%d/%m/%Y')
        allow(Time).to receive(:now).and_return(@todays_date)
        expect(account.print_statement).to eq("date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||    ||  50.0  ||  50.0 \n #{@todays_date}  ||  100.0  ||    ||  100.0")
      end

      it 'user can see the transactions in reverse chronological order' do
        account.withdraw(37.54)
        account.deposit(530.24)
        @todays_date = Time.now.strftime('%d/%m/%Y')
        allow(Time).to receive(:now).and_return(@todays_date)
        p account.print_statement
        expect(account.print_statement).to eq("date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||  530.24  ||    ||  542.7 \n #{@todays_date}  ||    ||  37.54  ||  12.46 \n #{@todays_date}  ||    ||  50.0  ||  50.0 \n #{@todays_date}  ||  100.0  ||    ||  100.0")
      end
    end
  end
end
