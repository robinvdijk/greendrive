class AddAvatarToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :avatar, :string
  end
end
