class AddScoreToCars < ActiveRecord::Migration
  def change
    add_column :cars, :score, :integer
  end
end
