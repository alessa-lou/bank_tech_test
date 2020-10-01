class BankAccount
  attr_accessor :balance, :transactions

  def initialize(statement = Statement.new)
    @balance = 0
    @transactions = []
    @statement = statement
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
    raise 'Not enough funds' if @balance <= 0 || amount > @balance
    # raise 'Not enough funds' if amount > @balance

    @balance -= amount
    add_transaction('', amount, @balance)
  end

  def print_statement
    "#{@statement.statement_header} \n #{@statement.print_transactions(transactions)}"
  end
end
