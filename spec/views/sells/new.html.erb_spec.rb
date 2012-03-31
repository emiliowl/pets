require 'spec_helper'

describe "sells/new" do
  before(:each) do
    assign(:sell, stub_model(Sell,
      :user => nil,
      :product => nil,
      :payment_options => "MyString"
    ).as_new_record)
  end

  it "renders new sell form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sells_path, :method => "post" do
      assert_select "select#sell_user_id", :name => "sell[user_id]"
      assert_select "select#sell_product_ids", :name => "sell[product_ids]"
      assert_select "select#sell_payment_options", :name => "sell[payment_options]"
    end
  end
end
