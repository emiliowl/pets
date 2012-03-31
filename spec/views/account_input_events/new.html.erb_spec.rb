require 'spec_helper'

describe "account_input_events/new" do
  before(:each) do
    assign(:account_input_event, stub_model(AccountInputEvent,
      :account => nil,
      :value => "9.99"
    ).as_new_record)
  end

  it "renders new account_input_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_input_events_path, :method => "post" do
      assert_select "select#account_input_event_account_id", :name => "account_input_event[account]"
      assert_select "input#account_input_event_value", :name => "account_input_event[value]"
    end
  end
end
