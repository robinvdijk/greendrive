class CreateSegments < ActiveRecord::Migration
  def change
    create_table "segments" do |t|
      t.string   "auth_token"
      t.integer   "company_id"
      t.integer   "mileage"
      t.integer   "drive_electric_ratio"
      t.datetime "created_at",             :null => false
      t.datetime "updated_at",             :null => false
    end
  end

end
