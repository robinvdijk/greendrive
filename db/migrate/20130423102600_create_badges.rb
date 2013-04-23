class CreateBadges < ActiveRecord::Migration
  def change
    create_table "badges" do |t|
      t.integer "tier"
      t.integer "value"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end
  end

end
