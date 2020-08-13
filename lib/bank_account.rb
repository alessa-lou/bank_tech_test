class BankAccount
  attr_accessor :balance, :credit, :debit, :date, :bank_statement

  def initialize
    @balance = 0
    @transactions = []
  end

  def deposit(amount)
    raise 'Cannot deposit a negative amount' if amount <= 0

    @balance += amount
    add_transaction(amount, '', @balance)
  end

  def add_transaction(credit, debit, balance)
    date = Time.now.strftime('%d/%m/%Y')
    @transactions << { date: date, credit: credit, debit: debit, balance: balance }
  end

  def withdraw(amount)
    raise 'Not enough funds' if @balance <= 0

    @balance -= amount
    add_transaction('', amount, @balance)
  end

  def collect_transactions
    transactions = @transactions.collect do |transaction|
      transaction.values.join('  ||  ')
    end
    reverse_order(transactions)
  end

  def reverse_order(transactions)
    reversed = transactions.reverse.each { |transaction| transaction }
    reversed.join(" \n ")
  end

  def statement_header
    'date  ||  credit  ||  debit  ||  balance'
  end

  def print_statement
    "#{statement_header} \n #{collect_transactions}"
  end
end
