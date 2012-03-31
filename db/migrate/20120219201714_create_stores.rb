class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.references :company

      t.timestamps
    end
    add_index :stores, :company_id
  end
end
