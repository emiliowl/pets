class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.references :store
      t.decimal :balance
      t.string :type
      
      t.timestamps
    end
    add_index :accounts, :store_id
  end
end
