require 'spec_helper'

describe "warehouse_output_events/new" do
  before(:each) do
    assign(:warehouse_output_event, stub_model(WarehouseOutputEvent,
      :product => nil,
      :store => nil,
      :quantity => 1
    ).as_new_record)
  end

  it "renders new warehouse_output_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => warehouse_output_events_path, :method => "post" do
      assert_select "select#warehouse_output_event_product_id", :name => "warehouse_output_event[product_id]"
      assert_select "select#warehouse_output_event_store_id", :name => "warehouse_output_event[store_id]"
      assert_select "input#warehouse_output_event_quantity", :name => "warehouse_output_event[quantity]"
    end
  end
end
