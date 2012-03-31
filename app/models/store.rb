class Store < ActiveRecord::Base
  has_many   :users
  belongs_to :company
  has_many   :product_inventories
  has_many   :warehouse_input_events
  has_many   :warehouse_output_events
  has_one    :account
  
  after_create do |store|
    StoreAccount.create!(:store_id => store.id, :balance => 0)
  end
end
