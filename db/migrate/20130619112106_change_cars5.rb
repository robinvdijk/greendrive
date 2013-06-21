class ChangeCars5 < ActiveRecord::Migration
  def change
    change_column_default :cars, :mileage_electric, 0
    change_column_default :cars, :mileage_fossile, 0
    change_column :cars, :last_week, :integer
    change_column :cars, :last_month, :integer
    
  end
end
