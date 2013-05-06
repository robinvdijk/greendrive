class AddMileageElectricToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :mileage_electric, :integer
  end
end
