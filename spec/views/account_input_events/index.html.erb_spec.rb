require 'spec_helper'

describe "account_input_events/index" do
  before(:each) do
    assign(:account_input_events, [
      stub_model(AccountInputEvent,
        :account => Factory.build(:store_account_compl),
        :value => "9.99"
      ),
      stub_model(AccountInputEvent,
        :account => Factory.build(:store_account_compl),
        :value => "9.99"
      )
    ])
  end

  it "renders a list of account_input_events" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyStore".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
