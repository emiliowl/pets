# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :store_account do
    balance 10
    association :store
    type "StoreAccount"
  end
  
  Factory.define :store_account_compl, :parent => :store_account do |acc|
    acc.after_build do |a|
      a.store = Factory.build(:store, :account => a)
    end
  end
  
end