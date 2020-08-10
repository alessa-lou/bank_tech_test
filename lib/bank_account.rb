class BankAccount

  attr_accessor :balance

  def initialize

    @balance = 0
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    if
      @balance <= 0
      raise "You have no funds left"
    else
      @balance -= amount
    end
  end
end
