class BankAccount
  attr_accessor :balance, :transactions

  def initialize
    @balance = 0
    @transactions = []
  end

  def format_amount(amount)
    format('%.2f' % amount)
  end

  def deposit(amount)
    raise 'Cannot deposit a negative amount' if amount <= 0
    amount = format_amount(amount)
    @balance += amount.to_f
    add_transaction(amount, '', '%.2f' % @balance)
  end

  def add_transaction(credit, debit, balance)
    date = Time.now.strftime('%d/%m/%Y')
    @transactions << { date: date, credit: credit, debit: debit, balance: balance }
  end

  def withdraw(amount)
    raise 'Not enough funds' if @balance <= 0 || amount > @balance
    amount = format_amount(amount)
    @balance -= amount.to_f
    add_transaction('', amount, '%.2f' % @balance)
  end

  def print_statement(statement = Statement.new)
    "#{statement.statement_header} \n #{statement.print_transactions(transactions)}"
  end

end
