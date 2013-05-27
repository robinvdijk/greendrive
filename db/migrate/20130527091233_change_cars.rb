class ChangeCars < ActiveRecord::Migration
  def change
    change_column_default :cars, :mileage_electric, 0
    change_column_default :cars, :mileage_fossile, 0
    change_column_default :cars, :mileage, 0
  end
end

