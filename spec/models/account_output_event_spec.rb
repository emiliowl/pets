require 'spec_helper'

describe AccountOutputEvent do
  context "on create" do
    it "must have account and value" do
      expect{ AccountOutputEvent.create!() }.to raise_error
      expect{ AccountOutputEvent.create!(:account_id => Factory.create(:account).id) }.to raise_error
      expect{ AccountOutputEvent.create!(:value => 9.99) }.to raise_error
    end
    
    it "must have sufficient funds to do the operation" do
      aie = AccountOutputEvent.new(:account_id => Factory.create(:account).id, :value => 10.01)
      expect {aie.save}.to raise_error(ArgumentError, "insufficient funds")
    end
    
    it "must call account withdraw and save its new state" do
      aie = AccountOutputEvent.new(:account_id => Factory.create(:account).id, :value => 9.99)
      aie.save.should be true
      aie.account.balance.should == 0.01
    end
    
  end
end
