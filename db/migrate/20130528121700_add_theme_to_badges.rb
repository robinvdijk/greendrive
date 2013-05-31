class AddThemeToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :theme, :string
  end
end
