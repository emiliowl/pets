class StoreAccount < Account
  
  def name
    store.name
  end
  
  belongs_to :store
  
  validates_uniqueness_of :store_id
end