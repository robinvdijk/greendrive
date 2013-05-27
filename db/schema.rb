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

ActiveRecord::Schema.define(:version => 20130527091233) do

  create_table "achievements", :force => true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badges", :force => true do |t|
    t.integer  "tier"
    t.integer  "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "avatar"
    t.integer  "points"
    t.string   "title"
  end

  create_table "cars", :force => true do |t|
    t.string   "license_plate"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "segment_id"
    t.integer  "mileage",          :default => 0
    t.integer  "mileage_electric", :default => 0
    t.integer  "mileage_fossile",  :default => 0
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "username"
    t.string   "password"
    t.string   "model"
  end

  create_table "segments", :force => true do |t|
    t.string   "auth_token"
    t.integer  "company_id"
    t.integer  "mileage"
    t.integer  "drive_electric_ratio"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "title"
    t.integer  "user_id"
    t.integer  "max_segment_id"
    t.integer  "remote_id"
    t.string   "license_plate"
    t.integer  "mileage_electric",     :default => 0
    t.integer  "mileage_fossile",      :default => 0
  end

  create_table "traces", :force => true do |t|
    t.string   "title"
    t.string   "licence_plate"
    t.float    "gps_longitude"
    t.float    "gps_latitude"
    t.float    "battery_value"
    t.float    "ambient_temp"
    t.datetime "created_at"
    t.float    "electric"
    t.float    "fossile"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "avatar"
    t.date     "birthday"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "role"
    t.boolean  "terms_of_service"
    t.boolean  "terms_of_privacy"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "middle_name"
    t.integer  "score"
    t.string   "rank"
  end

end
