class ChangeSegments3 < ActiveRecord::Migration
  def change
    change_column :segments, :mileage_electric, :float
    change_column :segments, :mileage_fossile, :float
    change_column :segments, :mileage, :float
  end
end
