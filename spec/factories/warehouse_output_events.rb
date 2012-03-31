# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :warehouse_output_event do
    association :product
    association :store
    quantity 1
  end
  
  Factory.define :warehouse_output_event_complete, :parent => :warehouse_output_event do |woe|
    woe.after_build do |w|
      w.product = Factory.build(:product, :warehouse_output_events => [w])
      w.store = Factory.build(:store, :warehouse_output_events => [w])
    end
  end
  
end
