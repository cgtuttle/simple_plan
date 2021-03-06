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

ActiveRecord::Schema.define(:version => 20120122220020) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "service",      :limit => 63
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "current_plan"
  end

  create_table "activities", :force => true do |t|
    t.string   "name",       :limit => 127
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",       :limit => 15
    t.string   "descr"
    t.integer  "account_id"
  end

  create_table "budgets", :force => true do |t|
    t.string   "code"
    t.string   "descr"
    t.integer  "account_id"
    t.date     "start_date"
    t.date     "end_date"
    t.decimal  "budget_expense"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.decimal  "budget_volume"
  end

  create_table "budgets_plans", :id => false, :force => true do |t|
    t.integer  "budget_id"
    t.integer  "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "code",       :limit => 15
    t.string   "name",       :limit => 63
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_accounts", :force => true do |t|
    t.integer  "category_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_products", :force => true do |t|
    t.integer  "category_id"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cells", :force => true do |t|
    t.integer  "import_id"
    t.integer  "row"
    t.integer  "column"
    t.string   "value"
    t.string   "destination"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deal_activities", :force => true do |t|
    t.integer  "deal_product_id"
    t.float    "rate"
    t.float    "volume"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "activity_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "volume_allocation"
    t.decimal  "plan_rate"
    t.decimal  "plan_vol"
    t.decimal  "deal_rate"
    t.decimal  "deal_vol"
    t.decimal  "est_volume"
    t.decimal  "reported_volume"
    t.decimal  "actual_expense"
  end

  create_table "deal_products", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "product_id"
    t.float    "rate"
    t.float    "volume"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "plan_rate"
    t.decimal  "plan_volume"
    t.decimal  "deal_rate"
    t.decimal  "deal_volume"
    t.decimal  "est_volume"
    t.decimal  "reported_volume"
    t.decimal  "actual_expense"
  end

  create_table "deals", :force => true do |t|
    t.integer  "program_id"
    t.integer  "customer_id"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status"
    t.date     "offered_on"
    t.date     "accepted_on"
    t.string   "offered_to"
    t.string   "accepted_by"
    t.text     "notes"
    t.decimal  "plan_rate"
    t.decimal  "plan_volume"
    t.decimal  "deal_rate"
    t.decimal  "deal_volume"
    t.decimal  "est_volume"
    t.decimal  "actual_expense"
    t.decimal  "reported_volume"
  end

  create_table "imports", :force => true do |t|
    t.integer  "account_id"
    t.integer  "user_id"
    t.string   "model"
    t.integer  "first_row"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "row_count"
  end

  create_table "partnerships", :force => true do |t|
    t.integer  "account_id"
    t.integer  "partner_id"
    t.string   "partner_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "descr"
    t.integer  "account_id"
    t.date     "start_date"
    t.date     "end_date"
    t.float    "budget_expense"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "release_status"
    t.integer  "owner_id"
    t.decimal  "budget_volume"
    t.integer  "seller_id"
    t.integer  "supplier_id"
  end

  create_table "products", :force => true do |t|
    t.string   "code",       :limit => 15
    t.string   "name",       :limit => 127
    t.string   "descr"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
  end

  create_table "profiles", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "last_plan"
    t.integer  "last_budget"
  end

  create_table "program_activities", :force => true do |t|
    t.integer  "program_id"
    t.integer  "activity_id"
    t.float    "budget_rate"
    t.float    "vol_alloc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "code",           :limit => 15, :null => false
    t.string   "name",           :limit => 63
    t.string   "descr"
    t.integer  "supplier_id"
    t.integer  "seller_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "budget_rate"
    t.float    "budget_volume"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "plan_id"
    t.integer  "category_id"
    t.decimal  "budget_expense"
  end

  create_table "settings", :force => true do |t|
    t.integer  "profile_id"
    t.string   "type_name",     :limit => 63
    t.string   "model_name"
    t.string   "view_name"
    t.string   "column_name"
    t.string   "setting_value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role",                   :limit => 63
    t.integer  "account_id"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
