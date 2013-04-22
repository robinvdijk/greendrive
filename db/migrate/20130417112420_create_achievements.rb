class CreateAchievements < ActiveRecord::Migration
  def change
    create_table :achievements do |t|
      t.string    "theme"
      t.string    "title"
      t.integer   "tier"
      t.integer   "user_id"
      t.timestamps
    end
  end
end
