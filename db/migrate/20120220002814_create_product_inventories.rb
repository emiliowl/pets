class CreateProductInventories < ActiveRecord::Migration
  def change
    create_table :product_inventories do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :store_id

      t.timestamps
    end
  end
end
