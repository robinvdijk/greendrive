class AddRatioToCars < ActiveRecord::Migration
  def change
    add_column :cars, :mileage_ratio, :integer, :default => 0
  end
end
