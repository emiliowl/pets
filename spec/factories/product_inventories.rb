# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_inventory do
    product_id 1
    quantity 1
    store_id 1
  end
end
