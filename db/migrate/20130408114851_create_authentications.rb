class CreateAuthentications < ActiveRecord::Migration
 def change
    create_table "authentications" do |t|
      t.integer "user_id"
      t.string "uid"
      t.string "provider"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end
  end
end
