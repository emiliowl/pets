require 'spec_helper'

describe "sells/show" do
  before(:each) do
    @sell = assign(:sell, stub_model(Sell,
      :user => Factory.build(:user_with_store),
      :product => nil,
      :payment_options => "Payment Options"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Payment Options/)
  end
end
