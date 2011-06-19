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

ActiveRecord::Schema.define(:version => 20110611160232) do

  create_table "addresses", :force => true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "country"
    t.string   "telnr"
    t.string   "mobile"
    t.string   "address_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "articles", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "format"
    t.integer  "auth_level",      :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "auth_level_edit", :default => 0, :null => false
  end

  create_table "blocks", :force => true do |t|
    t.string   "name"
    t.string   "headerline"
    t.string   "position"
    t.integer  "fieldorder"
    t.string   "blockid"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "auth_level",      :default => 0, :null => false
    t.integer  "auth_level_edit", :default => 0, :null => false
  end

  create_table "configurations", :force => true do |t|
    t.boolean  "block_left"
    t.integer  "block_left_width"
    t.boolean  "block_right"
    t.integer  "block_right_width"
    t.integer  "pagewidth"
    t.boolean  "block_headerline"
    t.string   "position_logo"
    t.boolean  "topimage"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "articles_name"
    t.boolean  "manage_tree",       :default => false
  end

  create_table "menues", :force => true do |t|
    t.string   "name"
    t.integer  "position"
    t.string   "the_url"
    t.string   "the_controller"
    t.string   "the_action"
    t.integer  "auth_level",      :default => 0, :null => false
    t.integer  "parent_id"
    t.boolean  "ontop"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "the_id"
    t.integer  "auth_level_edit", :default => 0, :null => false
    t.string   "ancestry"
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "notice"
    t.string   "format"
    t.integer  "auth_level",      :default => 0, :null => false
    t.integer  "auth_level_edit", :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productclasses", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "parent_id",       :default => 0, :null => false
    t.string   "picture"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
    t.integer  "auth_level",      :default => 0, :null => false
    t.integer  "auth_level_edit", :default => 0, :null => false
  end

  add_index "productclasses", ["ancestry"], :name => "index_productclasses_on_ancestry"

  create_table "products", :force => true do |t|
    t.string   "shorttext"
    t.text     "description"
    t.string   "producer"
    t.decimal  "price",               :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.decimal  "special_price",       :precision => 10, :scale => 2, :default => 0.0, :null => false
    t.string   "product_features"
    t.decimal  "weight",              :precision => 10, :scale => 0, :default => 0,   :null => false
    t.string   "unit_of_weight"
    t.string   "unit_of_quantity"
    t.integer  "tax_percentage",                                     :default => 0,   :null => false
    t.string   "image_url"
    t.string   "specification_sheet"
    t.integer  "auth_level",                                         :default => 0,   :null => false
    t.integer  "auth_level_edit",                                    :default => 0,   :null => false
    t.integer  "productclass_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "shipments", :force => true do |t|
    t.string   "name"
    t.integer  "weight_max"
    t.integer  "lenght_max"
    t.integer  "scale_id"
    t.integer  "auth_level"
    t.integer  "auth_level_edit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trees", :force => true do |t|
    t.string   "session_id"
    t.string   "model"
    t.integer  "model_id"
    t.string   "ancestry"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trees", ["session_id", "model", "model_id"], :name => "index_trees_on_session_id_and_model_and_model_id"

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "firstname"
    t.string   "lastname"
    t.integer  "auth_level",          :default => 0, :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "auth_level_edit",     :default => 0, :null => false
    t.string   "title"
    t.string   "wwwadress"
    t.string   "taxnumber"
    t.string   "customernumber"
    t.integer  "customergroup_id"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["login"], :name => "index_users_on_login", :unique => true
  add_index "users", ["persistence_token"], :name => "index_users_on_persistence_token", :unique => true

end
