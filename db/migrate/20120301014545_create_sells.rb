class CreateSells < ActiveRecord::Migration
  def change
    create_table :sells do |t|
      t.references :user
      t.string :payment_options

      t.timestamps
    end
    add_index :sells, :user_id
  end
end
