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

ActiveRecord::Schema.define(:version => 20130610141154) do

  create_table "achievements", :force => true do |t|
    t.integer  "badge_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "badges", :force => true do |t|
    t.integer  "tier"
    t.integer  "value"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "avatar"
    t.integer  "points"
    t.string   "subject"
    t.string   "description"
    t.string   "theme"
  end

  create_table "cars", :force => true do |t|
    t.string   "license_plate"
    t.integer  "company_id"
    t.integer  "user_id"
    t.integer  "segment_id"
    t.integer  "mileage",             :default => 1
    t.integer  "mileage_electric",    :default => 0
    t.integer  "mileage_fossile",     :default => 0
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "username"
    t.string   "password"
    t.string   "model"
    t.float    "last_week",           :default => 0.0
    t.float    "last_month",          :default => 0.0
    t.integer  "last_week_electric",  :default => 0
    t.integer  "last_month_electric", :default => 0
    t.integer  "last_year",           :default => 0
    t.integer  "last_year_electric",  :default => 0
    t.integer  "last_week_fossile",   :default => 0
    t.integer  "last_month_fossile",  :default => 0
    t.integer  "last_year_fossile",   :default => 0
    t.integer  "mileage_ratio",       :default => 0
    t.integer  "rank"
  end

  create_table "segments", :force => true do |t|
    t.string   "auth_token"
    t.integer  "company_id"
    t.float    "mileage"
    t.integer  "drive_electric_ratio"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "title"
    t.integer  "user_id"
    t.integer  "max_segment_id"
    t.integer  "remote_id"
    t.string   "license_plate"
    t.float    "mileage_electric",     :default => 0.0
    t.float    "mileage_fossile",      :default => 0.0
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
    t.string   "ratio"
  end

end
