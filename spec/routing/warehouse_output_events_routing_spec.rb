require "spec_helper"

describe WarehouseOutputEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/warehouse_output_events").should route_to("warehouse_output_events#index")
    end

    it "routes to #new" do
      get("/warehouse_output_events/new").should route_to("warehouse_output_events#new")
    end

    it "routes to #create" do
      post("/warehouse_output_events").should route_to("warehouse_output_events#create")
    end

  end
end
