# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence :bar_code do |n|
    "#{n}"
  end
  factory :product do
    name "Racao Master"
    description "MyText"
    bar_code
    cost_price 1.5
    sell_price 2
  end
end
