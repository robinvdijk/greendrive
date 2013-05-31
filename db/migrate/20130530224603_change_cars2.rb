class ChangeCars2 < ActiveRecord::Migration
  def change
    add_column :cars, :last_week, :float, :default => 0
    add_column :cars, :last_month, :float, :default => 0
    
  end
end
