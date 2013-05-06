class ChangeSegments < ActiveRecord::Migration
  def change
    change_column_default :segments, :mileage_electric, 0
  end
end