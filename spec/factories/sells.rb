# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :sell do
    user nil
    product nil
    payment_options "MyString"
  end
end
