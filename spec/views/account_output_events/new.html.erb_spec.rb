require 'spec_helper'

describe "account_output_events/new" do
  before(:each) do
    assign(:account_output_event, stub_model(AccountOutputEvent,
      :account => nil,
      :value => "9.99"
    ).as_new_record)
  end

  it "renders new account_output_event form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => account_output_events_path, :method => "post" do
      assert_select "select#account_output_event_account_id", :name => "account_output_event[account]"
      assert_select "input#account_output_event_value", :name => "account_output_event[value]"
    end
  end
end
