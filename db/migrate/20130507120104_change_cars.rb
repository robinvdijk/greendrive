class ChangeCars < ActiveRecord::Migration
  def change
    change_column_default :cars, :mileage_fossile, nil
    change_column_default :cars, :mileage_electric, nil
  end
end
