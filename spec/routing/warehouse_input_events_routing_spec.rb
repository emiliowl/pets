require "spec_helper"

describe WarehouseInputEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/warehouse_input_events").should route_to("warehouse_input_events#index")
    end

    it "routes to #new" do
      get("/warehouse_input_events/new").should route_to("warehouse_input_events#new")
    end

    it "routes to #create" do
      post("/warehouse_input_events").should route_to("warehouse_input_events#create")
    end

  end
end
