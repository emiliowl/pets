require 'spec_helper'

describe "sells/edit" do
  before(:each) do
    @sell = assign(:sell, stub_model(Sell,
      :user => nil,
      :product => nil,
      :payment_options => "MyString"
    ))
  end

  it "renders the edit sell form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sells_path(@sell), :method => "post" do
      assert_select "select#sell_user_id", :name => "sell[user_id]"
      assert_select "select#sell_product_ids", :name => "sell[product_ids]"
      assert_select "select#sell_payment_options", :name => "sell[payment_options]"
    end
  end
end
