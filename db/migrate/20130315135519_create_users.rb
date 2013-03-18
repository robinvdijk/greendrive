class CreateUsers < ActiveRecord::Migration
  def change
    create_table "users" do |t|
      t.string   "email"
      t.string   "password_digest"
      t.string   "first_name"
      t.string   "last_name"
      t.string   "user_name"
      t.string   "license_plate"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end
  end
end
