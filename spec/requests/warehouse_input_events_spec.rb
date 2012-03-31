require 'spec_helper'

describe "WarehouseInputEvents" do
  describe "GET /warehouse_input_events" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get warehouse_input_events_path
      response.status.should be(302)
    end
  end
end
