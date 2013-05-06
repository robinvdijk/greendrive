class ChangeSegments2 < ActiveRecord::Migration
  def change
    change_column_default :segments, :mileage_fossile, 0
    
  end
end
