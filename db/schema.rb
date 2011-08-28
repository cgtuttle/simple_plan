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

ActiveRecord::Schema.define(:version => 20110828181318) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service",    :limit => 63
    t.integer  "user_id"
  end

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["name"], :name => "index_activities_on_type", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "code",       :limit => 15
    t.string   "name",       :limit => 63
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "code",        :limit => 15, :null => false
    t.string   "name",        :limit => 63
    t.string   "descr"
    t.integer  "product_id"
    t.float    "deal_rate"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "program_id"
    t.integer  "category_id"
    t.integer  "customer_id"
    t.integer  "activity_id"
    t.float    "deal_vol"
    t.integer  "owner_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partnerships", :force => true do |t|
    t.integer  "provider_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "descr"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
  end

  create_table "programs", :force => true do |t|
    t.string   "code",        :limit => 15, :null => false
    t.string   "name",        :limit => 63
    t.string   "descr"
    t.integer  "supplier_id"
    t.integer  "seller_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "budget_rate"
    t.float    "budget_vol"
    t.float    "plan_rate"
    t.float    "plan_vol"
    t.integer  "owner_id"
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
    t.string   "role"
    t.integer  "account_id"
    t.string   "invitation_token",       :limit => 60
    t.datetime "invitation_sent_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["invitation_token"], :name => "index_users_on_invitation_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
