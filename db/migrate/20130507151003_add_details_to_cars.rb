class AddDetailsToCars < ActiveRecord::Migration
  def change
    add_column :cars, :username, :string
    add_column :cars, :password, :string
    add_column :cars, :model, :string    
  end
end
