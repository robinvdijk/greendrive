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

ActiveRecord::Schema.define(:version => 20130411100528) do

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "traces", :force => true do |t|
    t.string   "title"
    t.string   "licence_plate"
    t.float    "gps_longitude"
    t.float    "gps_latitude"
    t.float    "battery_value"
    t.float    "ambient_temp"
    t.datetime "created_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "license_plate"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
    t.string   "avatar"
    t.date     "birthday"
    t.string   "auth_token"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.string   "role"
    t.string   "permalink"
  end

  add_index "users", ["permalink"], :name => "index_users_on_permalink"

end
