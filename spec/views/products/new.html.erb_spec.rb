require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :description => "MyText",
      :bar_code => "MyString",
      :cost_price => 1.5,
      :sell_price => 1.5
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => products_path, :method => "post" do
      assert_select "input#product_name", :name => "product[name]"
      assert_select "textarea#product_description", :name => "product[description]"
      assert_select "input#product_bar_code", :name => "product[bar_code]"
      assert_select "input#product_cost_price", :name => "product[cost_price]"
      assert_select "input#product_sell_price", :name => "product[sell_price]"
    end
  end
end
