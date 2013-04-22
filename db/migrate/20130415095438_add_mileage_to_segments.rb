class AddMileageToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :mileage_electric, :integer
    add_column :segments, :mileage_fossile, :integer
  end
end
