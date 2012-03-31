class CreateAccountOutputEvents < ActiveRecord::Migration
  def change
    create_table :account_output_events do |t|
      t.references :account
      t.decimal :value

      t.timestamps
    end
    add_index :account_output_events, :account_id
  end
end
