class AddLicensePlateToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :license_plate, :string
  end
end
