# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "admin@company.com"
    password "123456"
    password_confirmation "123456"
    association :store
  end
  
  Factory.define :user_with_store, :parent => :user do |user|
    user.after_build do |u|
      u.store = Factory.build(:store, :users => [u])
    end
  end
end
