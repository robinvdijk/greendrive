class ChangeCars4 < ActiveRecord::Migration
  def change
    change_column_default :cars, :mileage, 1
  end
end
