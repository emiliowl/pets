require 'spec_helper'

describe Warehouse do
  context "on first warehouse input" do
    it "must check if product_inventory already exists, and because not, create the product_inventory" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #we don't have any event with this product_id
      ProductInventory.all.size.should == 0
      #must generate the product_inventory and set it quantity for the product/store
      warehouse.create_input_event(@product, 1, @store).should be true
      ProductInventory.all.size.should == 1
      
      # must find the total product quantity and product quantity for that store equal to 1
      warehouse.product_quantity(@product).should == 1
      warehouse.product_quantity_in_store(@product, @store).should == 1
    end
  end
  
  context "on others warehouse inputs" do
    it "must add the quantity to the existant product_inventory" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)
      @store2  = Factory.create(:store)

      warehouse = Warehouse.new
      #must generate the product_inventory and set it quantity for the product/store
      warehouse.create_input_event(@product, 1, @store).should be true
      # must find the total product quantity and product quantity for that store equal to 1
      warehouse.product_quantity(@product).should == 1
      warehouse.product_quantity_in_store(@product, @store).should == 1
      
      #must add 1 to the quantity of the product_inventory
      warehouse.create_input_event(@product, 1, @store).should be true
      # must find the total product quantity and product quantity for that store equal to 2
      warehouse.product_quantity(@product).should == 2
      warehouse.product_quantity_in_store(@product, @store).should == 2
    end
    
    it "must add the quantity to another product_inventory with the same product" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)
      @store2  = Factory.create(:store)

      warehouse = Warehouse.new
      #must generate the product_inventory and set it quantity for the product/store
      warehouse.create_input_event(@product, 1, @store).should be true
      # must find the total product quantity and product quantity for that store equal to 1
      warehouse.product_quantity(@product).should == 1
      warehouse.product_quantity_in_store(@product, @store).should == 1
      
      #must create another product_inventory, for the same product but for another store
      warehouse.create_input_event(@product, 1, @store2).should be true
      # must find the total product quantity and product quantity for that store equal to 2
      warehouse.product_quantity(@product).should == 2
      warehouse.product_quantity_in_store(@product, @store).should == 1
      warehouse.product_quantity_in_store(@product, @store2).should == 1
    end
  end
  
  context "on warehouse outputs" do
    it "can't make output without product_inventory" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #must raise Argument error because theres not product_inventory with this product/store
      expect{warehouse.create_output_event(@product, 1, @store)}.to raise_error(ArgumentError, "don't have this product at this store")
    end
    
    it "can't make output without enough product in inventory" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #must create the product_inventory with this product/store and quantity = 1
      warehouse.create_input_event(@product, 1, @store).should be true
      
      #must raise Argument error because theres not enough product in product_inventory with this product/store
      expect{warehouse.create_output_event(@product, 2, @store)}.to raise_error(ArgumentError, "don't have enough quantity for this product at this store")
    end
    
    it "must remove the quantity to the existant product_inventory" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #must create the product_inventory with this product/store and quantity = 1
      warehouse.create_input_event(@product, 2, @store).should be true
      warehouse.create_output_event(@product, 1, @store).should be true
      
      #must remain 1 product on the product_inventory with this product/store
      warehouse.product_quantity_in_store(@product, @store).should == 1
    end
  end
  
  context "on warehouse create methods" do
    it "must create a warehouse_input_event on database on the success call of create_input_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #must create the product_inventory with this product/store and quantity = 1
      warehouse.create_input_event(@product, 2, @store).should be true
      
      #must create the warehouse_input_event with this product, this store and quantity of 2
      WarehouseInputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 1
      WarehouseInputEvent.find_by_product_id_and_store_id(@product.id, @store.id).quantity.should == 2
    end
    
    it "must create a warehouse_input_event on database on the success call of create_input_with_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2, :store_id => @store.id)

      warehouse = Warehouse.new
      
      #must create the product_inventory with this product/store and quantity = 1
      (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be true
      
      #must create the warehouse_output_event with this product, this store and quantity of 2
      WarehouseInputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 1
      WarehouseInputEvent.find_by_product_id_and_store_id(@product.id, @store.id).quantity.should == 2
      
      #must have 2 products on the product_inventory with this product/store
      warehouse.product_quantity_in_store(@product, @store).should == 2
    end
    
    it "must fail on create a warehouse_input_event on database on the fail call of create_input_with_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2)

      warehouse = Warehouse.new
      
      #must create the product_inventory with this product/store and quantity = 1
      (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be false
      
      #deve possuir um erro de validacao no store
      wie.should have(1).error
      
      wie.errors.collect do |err, msg|
        err.should == :store_id
        msg.should == "Invalid Store"
      end
      
      #must not create warehouse_input_event
      WarehouseInputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 0
      
      #must not create product_inventory
      warehouse.product_quantity_in_store(@product, @store).should == 0
    end
    
    it "must create an warehouse_output_event on database on the success call of create_output_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      warehouse = Warehouse.new
      #must create the product_inventory with this product/store and quantity = 1
      warehouse.create_input_event(@product, 2, @store).should be true
      warehouse.create_output_event(@product, 1, @store).should be true
      
      #must create the warehouse_output_event with this product, this store and quantity of 1
      WarehouseOutputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 1
      WarehouseOutputEvent.find_by_product_id_and_store_id(@product.id, @store.id).quantity.should == 1
      
      #must remain 1 product on the product_inventory with this product/store
      warehouse.product_quantity_in_store(@product, @store).should == 1
    end
    
    it "must create a warehouse_output_event on database on the success call of create_output_with_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2, :store_id => @store.id)
      woe = WarehouseOutputEvent.new(:product_id => @product.id, :quantity => 1, :store_id => @store.id)

      warehouse = Warehouse.new
      
      #must create the product_inventory with this product/store and quantity = 2
      (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be true
      #must remove 1 from the product_inventory with this product/store
      (warehouse.create_output_with_event(woe) {|woevent| woe = woevent}).should be true
            
      #must create the warehouse_output_event with this product, this store and quantity of 1
      WarehouseOutputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 1
      WarehouseOutputEvent.find_by_product_id_and_store_id(@product.id, @store.id).quantity.should == 1
      
      #must have 2 products on the product_inventory with this product/store
      warehouse.product_quantity_in_store(@product, @store).should == 1
    end
    
    it "must fail on create a warehouse_output_event on database on the fail call of create_output_with_event" do
      @product = Factory.create(:product)
      @store   = Factory.create(:store)

      woe = WarehouseOutputEvent.new(:product_id => @product.id, :quantity => 2)

      warehouse = Warehouse.new
      
      #must create the product_inventory with this product/store and quantity = 1
      (warehouse.create_output_with_event(woe) {|woevent| woe = woevent}).should be false
      
      #deve possuir um erro de validacao no store
      woe.should have(1).error
      
      woe.errors.collect do |err, msg|
        err.should == :store_id
        msg.should == "Invalid Store"
      end
      
      #must not create warehouse_output_event
      WarehouseOutputEvent.find_all_by_product_id_and_store_id(@product.id, @store.id).size.should == 0
      
      #must not create product_inventory
      warehouse.product_quantity_in_store(@product, @store).should == 0
    end
  end
end