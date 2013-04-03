class AddBatteryValueToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :battery_value, :float
  end
end
