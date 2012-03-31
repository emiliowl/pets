# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :warehouse_input_event do
    association :product
    association :store
    quantity 1
  end
  
  Factory.define :warehouse_input_event_complete, :parent => :warehouse_input_event do |wie|
    wie.after_build do |w|
      w.product = Factory.build(:product, :warehouse_input_events => [w])
      w.store = Factory.build(:store, :warehouse_input_events => [w])
    end
  end
end
