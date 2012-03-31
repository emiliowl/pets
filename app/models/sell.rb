class Sell < ActiveRecord::Base
  belongs_to  :user
  has_many    :item_solds
  has_many    :products, :through => :item_solds
  
  validates_presence_of :user_id, :products, :payment_options
end
