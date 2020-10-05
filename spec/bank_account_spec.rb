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
    let(:statement_double) do double :statement
    allow(account).to receive(:print_statement).and_return("date  ||  credit  ||  debit  ||  balance \n 05/10/2020  ||  100.00  ||    ||  100.00 \n 05/10/2020  ||  50.00  ||    ||  150.00 ")
   end
    
    it 'user can see their balance on the bank statement' do
      account.deposit(100.00)
      account.deposit(50.00)
      expect(account.print_statement(statement_double)).to include('150.00')
    end

    it 'user can see money deposited transactions' do
      account.deposit(100.00)
      account.deposit(50.00)
      expect(account.print_statement(statement_double)).to include('100.00')
    end

    context 'user makes deposit and then withdraws' do
      before do
        @todays_date = Time.now.strftime('%d/%m/%Y')
      end

      let(:statement_double) do double :statement
        allow(account).to receive(:print_statement).and_return("date  ||  credit  ||  debit  ||  balance \n 05/10/2020  ||  100.00  ||    ||  100.00 \n 05/10/2020  ||    ||  50.00  ||  50.00")
       end

      it 'user can see money withdrawal transactions' do
        expect(account.print_statement(statement_double)).to include('50.00')
      end

      it 'user can see the date on each transaction' do
        expect(account.print_statement(statement_double)).to include("#{@todays_date}")
      end

      it 'user can see the transactions in a formatted table' do
        expect(account.print_statement(statement_double)).to eq("date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||  100.00  ||    ||  100.00 \n #{@todays_date}  ||    ||  50.00  ||  50.00")
      end

      # it 'user can see the transactions in reverse chronological order' do
      #   # account.withdraw(37.54)
      #   # account.deposit(530.24)
      #   # 
        # Not sure I can test for reverse chronological order when using mocking/ doubles ??
      
      #   expect(account.print_statement(statement_double)).to eq("date  ||  credit  ||  debit  ||  balance \n #{@todays_date}  ||  530.24  ||    ||  542.7 \n #{@todays_date}  ||    ||  37.54  ||  12.46 \n #{@todays_date}  ||    ||  50.0  ||  50.0 \n #{@todays_date}  ||  100.0  ||    ||  100.0")
      # end
    end
  end
end
