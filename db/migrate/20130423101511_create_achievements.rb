class CreateAchievements < ActiveRecord::Migration
  def change
    create_table "achievements" do |t|
      t.integer "badge_id"
      t.integer "user_id"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end
  end

end
