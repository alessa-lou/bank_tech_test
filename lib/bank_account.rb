class BankAccount

  attr_accessor :balance, :credit, :debit, :date, :bank_statement

  def initialize

    @balance = 0
    @bank_statement = []
    @credit = ""
    @debit = ""
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit(amount)
    @balance += amount
    @debit = amount
    @bank_statement << {date: @date, credit: @credit, debit: @debit, balance: @balance}
  end

  def withdraw(amount)
    if
      @balance <= 0
      raise "You have no funds left"
    else
      @balance -= amount
      @credit = amount
      @bank_statement << {date: @date, credit: @credit, debit: @debit, balance: @balance}
    end
  end

  def print_statement

     @bank_statement.collect do |transaction|
      "date  ||  credit  ||  debit  ||  balance \n #{transaction.values.join("  ||  ")}"
     end
  end
end
