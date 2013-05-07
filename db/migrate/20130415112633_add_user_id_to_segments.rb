class AddUserIdToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :user_id, :integer
  end
end
