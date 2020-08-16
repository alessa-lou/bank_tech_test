class Statement

  def print_transactions(transactions)
    transactions = transactions.collect do |transaction|
      transaction.values.join('  ||  ')
    end
    reverse_order(transactions)
  end

  def reverse_order(transactions)
    reversed = transactions.reverse.each { |transaction| transaction }
    reversed.join(" \n ")
  end
end
