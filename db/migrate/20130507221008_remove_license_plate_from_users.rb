class RemoveLicensePlateFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :license_plate
  end
end
