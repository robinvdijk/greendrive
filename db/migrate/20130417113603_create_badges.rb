class CreateBadges < ActiveRecord::Migration
  def change
    create_table :badges do |t|
      t.string    "theme"
      t.integer   "tier"
      t.string    "field_op"
      t.string    "field_v"
      t.string    "field_c"
      t.timestamps
    end
  end
end
