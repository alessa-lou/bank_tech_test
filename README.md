Requirements

You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
Deposits, withdrawal.
Account statement (date, amount, balance) printing.
Data can be kept in memory (it doesn't need to be stored to a database or anything).
Acceptance criteria

Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see

date       || credit  || debit  || balance
14/01/2012 ||         || 500.00 || 2500.00
13/01/2012 || 2000.00 ||        || 3000.00
10/01/2012 || 1000.00 ||        || 1000.00

My approach:

* wrote out the acceptance criteria as user stories (below)
* thought about the nouns and verbs in the user stories and converted those to classes/ methods
* feature tested in irb 


User Stories
============

As a user
So that I have money in the bank
I want to be able to deposit money

As a User
so that I can spend my money
I want to be able to withdraw money

As a User
so that I can track my money
I want to be able to print my bank statement

As a User
So that I can track my spending
I want to know the date I made transactions


Edge cases:

* Can't withdraw money if balance is nil
* Can't withdraw more money than is available
* Can't deposit zero pounds

How to run:

bundle install
start IRB:
* require './lib/bank_account'
* account = BankAccount.new

Then use withdraw(amount)/ deposit(amount)/ print_statement methods

How to run tests:
rspec
