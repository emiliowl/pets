class CreateItemSolds < ActiveRecord::Migration
  def change
    create_table :item_solds do |t|
      t.references :product, :sell
      t.decimal :value
      t.integer :quantity

      t.timestamps
    end
    add_index :item_solds, :product_id
    add_index :item_solds, :sell_id
  end
end
