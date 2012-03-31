require 'spec_helper'

describe Account do
  context "on deposit" do
    it "must increase balance" do
      @account   = Factory.create(:account)
      @value     = 1

      #efetuate a deposit on the account
      @account.deposit(@value)
      
      #must have 11 money on user account
      @account.balance.should == 11
    end
  end
  
  context "on withdraw" do
    it "must decrease balance" do
      @account   = Factory.create(:account)
      @value     = 1

      #efetuate a withdraw on the account
      @account.withdraw(@value)
      
      #must have 9 money on user account
      @account.balance().should == 9
    end
    
    it "must check if its a positive value" do
      @account   = Factory.create(:account)
      @value     = -1

      #efetuate a withdraw on the account
      expect{@account.withdraw(@value)}.to raise_error ArgumentError, 'must be a positive number'
      
      #original balance must be safe
      @account.balance().should == 10
    end
    
    it "must check if has enough funds" do
      @account   = Factory.create(:account)
      @value     = 20

      #efetuate a withdraw on the account
      expect{@account.withdraw(@value)}.to raise_error ArgumentError, 'insufficient funds'
      
      #original balance must be safe
      @account.balance().should == 10
    end
  end
end