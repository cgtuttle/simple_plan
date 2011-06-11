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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20110605195508) do
=======
ActiveRecord::Schema.define(:version => 20110605200120) do
>>>>>>> user_roles

  create_table "activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["name"], :name => "index_activities_on_type", :unique => true

  create_table "categories", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.integer  "supplier_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deals", :force => true do |t|
    t.string   "code"
    t.integer  "product_id"
    t.float    "rate"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "domain_classes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_permissions", :force => true do |t|
    t.string   "permission_type"
    t.string   "model"
    t.integer  "domain_class_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "code"
    t.string   "descr"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "programs", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "descr"
    t.integer  "supplier_id"
    t.integer  "category_id"
    t.integer  "rep_id"
    t.integer  "customer_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rep_categories", :force => true do |t|
    t.integer  "rep_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

<<<<<<< HEAD
=======
  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

>>>>>>> user_roles
  create_table "user_types", :force => true do |t|
    t.string   "code"
    t.string   "descr"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "domain"
    t.integer  "type_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
