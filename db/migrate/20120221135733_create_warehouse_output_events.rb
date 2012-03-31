class CreateWarehouseOutputEvents < ActiveRecord::Migration
  def change
    create_table :warehouse_output_events do |t|
      t.references :product
      t.references :store
      t.integer :quantity

      t.timestamps
    end
    add_index :warehouse_output_events, :product_id
    add_index :warehouse_output_events, :store_id
  end
end
