require "spec_helper"

describe AccountInputEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/account_input_events").should route_to("account_input_events#index")
    end

    it "routes to #new" do
      get("/account_input_events/new").should route_to("account_input_events#new")
    end

    it "routes to #create" do
      post("/account_input_events").should route_to("account_input_events#create")
    end
  
  end
end
