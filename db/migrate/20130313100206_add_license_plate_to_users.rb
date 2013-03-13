class AddLicensePlateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :license_plate, :string
  end
end
