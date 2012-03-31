class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :bar_code
      t.float :cost_price
      t.float :sell_price

      t.timestamps
    end
  end
end
