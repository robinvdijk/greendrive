class AddIntervalsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :last_week_electric, :float, :default => 0
    add_column :cars, :last_month_electric, :float, :default => 0
    add_column :cars, :last_year, :float, :default => 0
    add_column :cars, :last_year_electric, :float, :default => 0

    
  end
end
