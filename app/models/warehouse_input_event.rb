class WarehouseInputEvent < ActiveRecord::Base
  belongs_to :product
  belongs_to :store

  validates_presence_of :product_id, :store_id, :quantity
end
