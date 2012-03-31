class Warehouse

  def create_input_with_event(warehouse_input_event)
    raise ArgumentError, 'Invalid WarehouseInputEvent' unless warehouse_input_event.is_a? WarehouseInputEvent
    begin
      self.create_input_event(warehouse_input_event.product, warehouse_input_event.quantity, warehouse_input_event.store) do |wie|
        warehouse_input_event = wie
      end
      yield(warehouse_input_event) if block_given? #passes the created warehouse_input_event to the caller
    rescue ArgumentError => err #if some validation error occurs on creating, add it to the model errors
      warehouse_input_event.errors[:product_id] << err.message if err.message.downcase.include?"product"
      warehouse_input_event.errors[:store_id] << err.message if err.message.downcase.include?"store"
      warehouse_input_event.errors[:quantity] << err.message if err.message.downcase.include?"quantity"      
      return false
    end
    true
  end

  def create_input_event(product, quantity, store)
    raise ArgumentError, 'Invalid Product'           unless product.is_a? Product
    raise ArgumentError, 'Invalid Store'             unless store.is_a? Store
    raise ArgumentError, 'Quantity must be numeric'  unless quantity.is_a? Numeric
    raise ArgumentError, 'Quantity must be positive' unless quantity > 0
    
    pi = nil
    begin #check if product_inventory already exists for product/store
      pi = ProductInventory.find_by_product_id_and_store_id!(product.id, store.id)
    rescue Exception => ex #if product_inventory doesn't exists, create one
      pi = ProductInventory.new
      pi.product_id = product.id
      pi.store_id   = store.id
      pi.quantity   = 0
    end

    #do the input event in fact
    pi.quantity += quantity
    #return true only if the Transaction runs OK
    ActiveRecord::Base.transaction do
      pi.save!
      wie = WarehouseInputEvent.new(:product_id => product.id, :store_id => store.id, :quantity => quantity)
      wie.save!
      #if called with a block, return the WarehouseInputEvent created
      yield(wie) if block_given?
      true #if everything goes ok in transaction return true
    end
  end
  
  def create_output_with_event(warehouse_output_event)
    raise ArgumentError, 'Invalid WarehouseOutputEvent' unless warehouse_output_event.is_a? WarehouseOutputEvent
    begin
      self.create_output_event(warehouse_output_event.product, warehouse_output_event.quantity, warehouse_output_event.store) do |woe|
        warehouse_output_event = woe
      end
      yield(warehouse_output_event) if block_given? #passes the created warehouse_output_event to the caller
    rescue ArgumentError => err #if some validation error occurs on creating, add it to the model errors
      warehouse_output_event.errors[:product_id] << err.message if err.message.downcase.include?"product"
      warehouse_output_event.errors[:store_id] << err.message if err.message.downcase.include?"store"
      warehouse_output_event.errors[:quantity] << err.message if err.message.downcase.include?"quantity"      
      return false
    end
    true
  end
  
  def create_output_event(product, quantity, store)
    raise ArgumentError, 'Invalid Product'           unless product.is_a? Product
    raise ArgumentError, 'Invalid Store'             unless store.is_a? Store
    raise ArgumentError, 'Quantity must be numeric'  unless quantity.is_a? Numeric
    raise ArgumentError, 'Quantity must be positive' unless quantity > 0
    
    pi = nil
    begin #check if product_inventory already exists for product/store
      pi = ProductInventory.find_by_product_id_and_store_id!(product.id, store.id)
    rescue Exception => ex #if product_inventory doesn't exists, raise exception for the caller
      raise ArgumentError, "don't have this product at this store"
    end

    #do the output event in fact if have sufficient quantity
    if pi.quantity >= quantity
      pi.quantity -= quantity
      #return true only if the Transaction runs OK
      ActiveRecord::Base.transaction do
        pi.save!
        woe = WarehouseOutputEvent.new(:product_id => product.id, :store_id => store.id, :quantity => quantity)
        woe.save!
        #if called with a block, return the WarehouseOutputEvent created
        yield(woe) if block_given?
        true #if everything goes ok in transaction return true
      end
    else
      raise ArgumentError, "don't have enough quantity for this product at this store"
    end
  end
  
  # Find all products at warehouse
  def product_quantity(product)
    raise ArgumentError, 'Invalid Product' unless product.is_a? Product
    quantity = 0
    ProductInventory.find_all_by_product_id(product.id).each do |product_inventory|
      quantity += product_inventory.quantity
    end
    return quantity
  end
  
  # Find all product at warehouse on specific store
  def product_quantity_in_store(product, store)
    raise ArgumentError, 'Invalid Product' unless product.is_a? Product
    raise ArgumentError, 'Invalid Store'   unless store.is_a? Store
    begin
      return ProductInventory.find_by_product_id_and_store_id!(product.id, store.id).quantity
    rescue # if product_inventory doesn't exist yet, return 0
      return 0
    end
  end

end