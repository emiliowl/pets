require 'spec_helper'

describe "sells/index" do
  before(:each) do
    assign(:sells, [
      stub_model(Sell,
        :user => Factory.build(:user_with_store),
        :product => nil,
        :payment_options => "Payment Options"
      ),
      stub_model(Sell,
        :user => Factory.build(:user_with_store),
        :product => nil,
        :payment_options => "Payment Options"
      )
    ])
  end

  it "renders a list of sells" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Payment Options".to_s, :count => 2
  end
end
