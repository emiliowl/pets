require 'spec_helper'

describe "warehouse_input_events/index" do
  before(:each) do
    assign(:warehouse_input_events, [
      stub_model(WarehouseInputEvent,
        :product => stub_model(Product, :name => "Product"),
        :store => stub_model(Store, :name => "Store"),
        :quantity => 1
      ),
      stub_model(WarehouseInputEvent,
        :product => stub_model(Product, :name => "Product"),
        :store => stub_model(Store, :name => "Store"),
        :quantity => 1
      )
    ])
  end

  it "renders a list of warehouse_input_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Product".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Store".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
