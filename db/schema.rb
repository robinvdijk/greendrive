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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20130315135520) do
=======
ActiveRecord::Schema.define(:version => 20130315185525) do
>>>>>>> 93c22395c853619ae22ae0d32133ed0bd96a0e59
=======
ActiveRecord::Schema.define(:version => 20130318062016) do
>>>>>>> a59135dc9cd67b8558a6a18f01904048bd6a1255

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name"
    t.string   "license_plate"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
<<<<<<< HEAD
<<<<<<< HEAD
    t.string   "avatar"
=======
    t.datetime "birthday"
>>>>>>> 93c22395c853619ae22ae0d32133ed0bd96a0e59
=======
    t.date     "birthday"
>>>>>>> a59135dc9cd67b8558a6a18f01904048bd6a1255
  end

end
