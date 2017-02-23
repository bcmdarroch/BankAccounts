require 'csv'

module Bank

  class Account
    attr_reader :id, :balance, :date
    attr_accessor :owner

    def self.all
      all_accounts = []
      CSV.open("/Users/brenna/ada/week3/BankAccounts/support/accounts.csv").each do | line |
        all_accounts << Bank::Account.new(line[0].to_i, line[1].to_f, line[2])
      end
      all_accounts
    end

    def self.find(id)
      accounts = Bank::Account.all
      raise ArgumentError.new("There's no such account ID, you nincompoop.") if ![1212, 1213, 1214, 1215, 1216, 1217, 15151, 15152, 15153, 15154, 15155, 15156].include?(id)
      accounts.each_with_index do |acct, index|
          if acct.id == id
            return accounts[index]
          end
      end
    end

    def initialize(id, balance, date, owner = "Customer Name")
      raise ArgumentError.new("You cannot create a bank account with a 0 or negative balance, you goober.") if balance < 0
      @id = id
      @balance = balance
      @date = date
      @owner = owner
    end

    def withdraw(withdrawal_amount)
      raise ArgumentError.new("You cannot withdraw a negative amount of money, you silly pants.") if withdrawal_amount < 0
      # if withdrawal_amount > 0
        if withdrawal_amount > @balance
          print "Uh oh! You can't overdraw your account, you doof!"
        else
          return @balance -= withdrawal_amount
        end
        return @balance
      # else
      #   raise ArgumentError.new "You cannot withdraw a negative amount of money, you silly pants."
      # end
    end

    def deposit(deposit_amount)
      raise ArgumentError.new("You cannot deposit a negative amount of money, you goofball.") if deposit_amount < 0
      # if deposit_amount > 0
        @balance += deposit_amount
      # else
        # raise ArgumentError.new "You cannot deposit a negative amount of money, you goofball."
    end

  end

end
