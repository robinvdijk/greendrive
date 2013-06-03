class AddIntervalsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :last_week_electric, :integer, :default => 0
    add_column :cars, :last_month_electric, :integer, :default => 0
    add_column :cars, :last_year, :integer, :default => 0
    add_column :cars, :last_year_electric, :integer, :default => 0
    add_column :cars, :last_week_fossile, :integer, :default => 0
    add_column :cars, :last_month_fossile, :integer, :default => 0
    add_column :cars, :last_year_fossile, :integer, :default => 0
    
    
    
    

    
  end
end
