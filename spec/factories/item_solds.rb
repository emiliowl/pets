# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :item_sold do
    product nil
    value "9.99"
    sell nil
  end
end
