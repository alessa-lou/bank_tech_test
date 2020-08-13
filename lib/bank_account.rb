class BankAccount
  attr_accessor :balance, :credit, :debit, :date, :bank_statement

  def initialize
    @balance = 0
    @bank_statement = [{ string: 'date  ||  credit  ||  debit  ||  balance' }]
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    @balance += amount
    add_transaction(amount, '', @balance)
  end

  def add_transaction(credit, debit, balance)
    @bank_statement << { date: @date, credit: credit, debit: debit, balance: balance }
  end

  def withdraw(amount)
    raise 'Not enough funds' if @balance <= 0

    @balance -= amount
    add_transaction('', amount, @balance)
  end

  def print_statement
    transactions = @bank_statement.collect do |transaction|
      transaction.values.join('  ||  ')
    end
    transactions.join("\n")
  end
end
