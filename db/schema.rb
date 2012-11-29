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

ActiveRecord::Schema.define(:version => 20121129050051) do

  create_table "commitments", :force => true do |t|
    t.integer  "house_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "commitments", ["user_id", "house_id"], :name => "index_commitments_on_user_id_and_house_id", :unique => true

  create_table "facebook_profiles", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "image"
    t.string   "url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "facebook_profiles", ["user_id"], :name => "index_facebook_profiles_on_user_id", :unique => true

  create_table "houses", :force => true do |t|
    t.string   "title"
    t.string   "address",     :null => false
    t.text     "description"
    t.string   "maps_link"
    t.integer  "rooms"
    t.integer  "beds"
    t.integer  "capacity"
    t.integer  "total_cost",  :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "bathrooms"
    t.string   "image"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                                :null => false
    t.string   "email",                               :null => false
    t.string   "gender"
    t.text     "bio"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.string   "oauth_expires_at"
    t.boolean  "admin",            :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
