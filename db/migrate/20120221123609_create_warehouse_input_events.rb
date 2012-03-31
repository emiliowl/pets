class CreateWarehouseInputEvents < ActiveRecord::Migration
  def change
    create_table :warehouse_input_events do |t|
      t.references :product
      t.references :store
      t.integer :quantity

      t.timestamps
    end
    add_index :warehouse_input_events, :product_id
    add_index :warehouse_input_events, :store_id
  end
end
