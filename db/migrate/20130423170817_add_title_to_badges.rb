class AddTitleToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :title, :string
  end
end
