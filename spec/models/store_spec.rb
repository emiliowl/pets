require 'spec_helper'

describe Store do
  context "on store creation" do
    it "must create one store_account" do
      @company = Factory.create(:company)
      store = Store.create(:company_id => @company.id, :name => "Store#1")

      store.account.persisted?.should be true
    end
  end
end
