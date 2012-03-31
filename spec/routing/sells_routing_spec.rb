require "spec_helper"

describe SellsController do
  describe "routing" do

    it "routes to #index" do
      get("/sells").should route_to("sells#index")
    end

    it "routes to #new" do
      get("/sells/new").should route_to("sells#new")
    end

    it "routes to #show" do
      get("/sells/1").should route_to("sells#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sells/1/edit").should route_to("sells#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sells").should route_to("sells#create")
    end

    it "routes to #update" do
      put("/sells/1").should route_to("sells#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sells/1").should route_to("sells#destroy", :id => "1")
    end

  end
end
