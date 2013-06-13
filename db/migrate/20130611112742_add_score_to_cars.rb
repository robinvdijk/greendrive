class AddScoreToCars < ActiveRecord::Migration
  def change
    add_column :cars, :score, :integer, :default => 0
  end
end
