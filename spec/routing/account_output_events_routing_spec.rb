require "spec_helper"

describe AccountOutputEventsController do
  describe "routing" do

    it "routes to #index" do
      get("/account_output_events").should route_to("account_output_events#index")
    end

    it "routes to #new" do
      get("/account_output_events/new").should route_to("account_output_events#new")
    end

    it "routes to #create" do
      post("/account_output_events").should route_to("account_output_events#create")
    end

  end
end
