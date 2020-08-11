class BankAccount
  attr_accessor :balance, :credit, :debit, :date, :bank_statement

  def initialize
    @balance = 0
    @bank_statement = [{ string: 'date  ||  credit  ||  debit  ||  balance' }]
    @credit = ''
    @debit = ''
    @date = Time.now.strftime('%d/%m/%Y')
  end

  def deposit(amount)
    @balance += amount
    @debit = amount
    @bank_statement << { date: @date, credit: @credit, debit: @debit, balance: @balance }
  end

  def withdraw(amount)
    raise 'You have no funds left' if @balance <= 0

    @balance -= amount
    @credit = amount
    @bank_statement << { date: @date, credit: @credit, debit: @debit, balance: @balance }
  end

  def print_statement
    transactions = @bank_statement.collect do |transaction|
      transaction.values.join('  ||  ')
    end
    transactions.join("\n")
  end
end
