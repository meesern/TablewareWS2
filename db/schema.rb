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

ActiveRecord::Schema.define(:version => 20120823111701) do

  create_table "codes", :force => true do |t|
    t.string   "codepoint"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "dish_id"
    t.integer  "offer_id"
  end

  add_index "codes", ["dish_id"], :name => "index_codes_on_dish_id"
  add_index "codes", ["offer_id"], :name => "index_codes_on_offer_id"

  create_table "communiques", :force => true do |t|
    t.string   "message"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "ack"
  end

  add_index "communiques", ["customer_id"], :name => "index_communiques_on_customer_id"

  create_table "customers", :force => true do |t|
    t.string   "uname"
    t.string   "known_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "party_id"
  end

  add_index "customers", ["party_id"], :name => "index_customers_on_party_id"

  create_table "dishes", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "url1"
    t.string   "url2"
    t.string   "url3"
  end

  create_table "encounters", :force => true do |t|
    t.string   "comment"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "dish_id"
  end

  add_index "encounters", ["dish_id"], :name => "index_encounters_on_dish_id"
  add_index "encounters", ["user_id"], :name => "index_encounters_on_user_id"

  create_table "offers", :force => true do |t|
    t.string   "name"
    t.string   "image"
    t.string   "title"
    t.string   "url1"
    t.string   "url2"
    t.string   "url3"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parties", :force => true do |t|
    t.string   "name"
    t.integer  "table"
    t.datetime "seated"
    t.datetime "left"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "name"
    t.string   "email_address"
    t.boolean  "administrator",                           :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "state",                                   :default => "invited"
    t.datetime "key_timestamp"
    t.string   "favourites"
    t.string   "offers"
  end

  add_index "users", ["state"], :name => "index_users_on_state"

end
