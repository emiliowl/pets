require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WarehouseOutputEventsController do
  login_user
  # This should return the minimal set of attributes required to create a valid
  # WarehouseOutputEvent. As you add validations to WarehouseOutputEvent, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {
      :product_id => Factory.create(:product).id,
      :store_id => Factory.create(:store).id,
      :quantity => 1
    }
  end
  
  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WarehouseOutputEventsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all warehouse_output_events as @warehouse_output_events" do
      warehouse_output_events = WarehouseOutputEvent.all
      get :index, {}
      assigns(:warehouse_output_events).should eq(warehouse_output_events)
    end
  end
  
  describe "GET new" do
    it "assigns a new warehouse_output_event as @warehouse_output_event" do
      get :new, {}
      assigns(:warehouse_output_event).should be_a_new(WarehouseOutputEvent)
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new WarehouseOutputEvent" do
        #creating the input to able the output
        @product = Factory.create(:product)
        @store   = Factory.create(:store)
        wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2, :store_id => @store.id)
        warehouse = Warehouse.new
        #must create the product_inventory with this product/store and quantity = 2
        (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be true
        
        expect {
          post :create, {:warehouse_output_event => {:product_id => @product.id, :quantity => 1, :store_id => @store.id}}
        }.to change(WarehouseOutputEvent, :count).by(1)
      end

      it "assigns a newly created warehouse_output_event as @warehouse_output_event" do
        #creating the input to able the output
        @product = Factory.create(:product)
        @store   = Factory.create(:store)
        wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2, :store_id => @store.id)
        warehouse = Warehouse.new
        #must create the product_inventory with this product/store and quantity = 2
        (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be true
        
        post :create, {:warehouse_output_event => {:product_id => @product.id, :quantity => 1, :store_id => @store.id}}
        assigns(:warehouse_output_event).should be_a(WarehouseOutputEvent)
        assigns(:warehouse_output_event).should be_persisted
      end

      it "redirects to the index of warehouse_output_event" do
        #creating the input to able the output
        @product = Factory.create(:product)
        @store   = Factory.create(:store)
        wie = WarehouseInputEvent.new(:product_id => @product.id, :quantity => 2, :store_id => @store.id)
        warehouse = Warehouse.new
        #must create the product_inventory with this product/store and quantity = 2
        (warehouse.create_input_with_event(wie) {|wievent| wie = wievent}).should be true
        
        post :create, {:warehouse_output_event => {:product_id => @product.id, :quantity => 1, :store_id => @store.id}}
        response.should redirect_to(warehouse_output_events_url)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved warehouse_output_event as @warehouse_output_event" do
        # Trigger the behavior that occurs when invalid params are submitted
        WarehouseOutputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:warehouse_output_event => {}}
        assigns(:warehouse_output_event).should be_a_new(WarehouseOutputEvent)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WarehouseOutputEvent.any_instance.stub(:save).and_return(false)
        post :create, {:warehouse_output_event => {}}
        response.should render_template("new")
      end
    end
  end

end