class CreateAccountInputEvents < ActiveRecord::Migration
  def change
    create_table :account_input_events do |t|
      t.references :account
      t.decimal :value

      t.timestamps
    end
    add_index :account_input_events, :account_id
  end
end
