class AddRankToCars < ActiveRecord::Migration
  def change
    add_column :cars, :rank, :integer
  end
end
