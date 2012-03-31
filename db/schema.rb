# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120301032301) do

  create_table "account_input_events", :force => true do |t|
    t.integer  "account_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_input_events", ["account_id"], :name => "index_account_input_events_on_account_id"

  create_table "account_output_events", :force => true do |t|
    t.integer  "account_id"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "account_output_events", ["account_id"], :name => "index_account_output_events_on_account_id"

  create_table "accounts", :force => true do |t|
    t.integer  "store_id"
    t.decimal  "balance"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "accounts", ["store_id"], :name => "index_accounts_on_store_id"

  create_table "admins", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email", :unique => true
  add_index "admins", ["reset_password_token"], :name => "index_admins_on_reset_password_token", :unique => true

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_solds", :force => true do |t|
    t.integer  "product_id"
    t.integer  "sell_id"
    t.decimal  "value"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "item_solds", ["product_id"], :name => "index_item_solds_on_product_id"
  add_index "item_solds", ["sell_id"], :name => "index_item_solds_on_sell_id"

  create_table "product_inventories", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "bar_code"
    t.float    "cost_price"
    t.float    "sell_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sells", :force => true do |t|
    t.integer  "user_id"
    t.string   "payment_options"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sells", ["user_id"], :name => "index_sells_on_user_id"

  create_table "stores", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "stores", ["company_id"], :name => "index_stores_on_company_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.integer  "store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "warehouse_input_events", :force => true do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "warehouse_input_events", ["product_id"], :name => "index_warehouse_input_events_on_product_id"
  add_index "warehouse_input_events", ["store_id"], :name => "index_warehouse_input_events_on_store_id"

  create_table "warehouse_output_events", :force => true do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "warehouse_output_events", ["product_id"], :name => "index_warehouse_output_events_on_product_id"
  add_index "warehouse_output_events", ["store_id"], :name => "index_warehouse_output_events_on_store_id"

end
