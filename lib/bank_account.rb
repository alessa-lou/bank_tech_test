class BankAccount

  attr_reader :balance

  def initialize

    @balance = []
  end

  def deposit(amount)
    @balance << amount
  end
end
