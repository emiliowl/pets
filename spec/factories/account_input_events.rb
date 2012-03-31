# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :account_input_event do
    account nil
    value "9.99"
  end
end
