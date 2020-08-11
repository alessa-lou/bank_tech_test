class BankAccount

  attr_accessor :balance, :credit, :debit, :date, :bank_statement

  def initialize

    @balance = 0
    @bank_statement = []
    # @credit = []
    # @debit = []
    @date = Time.now.strftime("%d/%m/%Y")
  end

  def deposit(amount)
    @balance += amount
    @debit = amount
    @bank_statement << {debit: @debit, date: @date}
  end

  def withdraw(amount)
    if
      @balance <= 0
      raise "You have no funds left"
    else
      @balance -= amount
      @credit = amount
      @bank_statement << {credit: @credit, date: @date}
    end
  end

  def print_statement
    "credit  ||  debit  || balance \n #{@bank_statement[0][:credit]}  ||  #{@bank_statement[0][:debit]}  ||  #{@balance}"
  end
end
