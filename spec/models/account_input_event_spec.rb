require 'spec_helper'

describe AccountInputEvent do
  context "on create" do
    it "must have account and value" do
      expect{ AccountInputEvent.create!() }.to raise_error
      expect{ AccountInputEvent.create!(:account_id => Factory.create(:account).id) }.to raise_error
      expect{ AccountInputEvent.create!(:value => 9.99) }.to raise_error
    end
    it "must call account deposit and save it" do
      aie = AccountInputEvent.new(:account_id => Factory.create(:account).id, :value => 9.99)
      aie.save.should be true
      aie.account.balance.should == 19.99
    end
  end
end
