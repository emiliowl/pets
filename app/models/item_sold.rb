class ItemSold < ActiveRecord::Base
  belongs_to :product
  belongs_to :sell
end
