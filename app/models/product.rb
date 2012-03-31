class Product < ActiveRecord::Base
  has_many :product_inventories
  has_many :warehouse_input_events
  has_many :warehouse_output_events
  has_many :item_solds
  has_many :sells, :through => :item_solds
  
  validates_uniqueness_of :bar_code
end
