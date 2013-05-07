class AddRemoteIdToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :remote_id, :integer
  end
end
