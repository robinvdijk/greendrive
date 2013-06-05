class AddRatioToUsers < ActiveRecord::Migration
  def change
    add_column :users, :ratio, :string
  end
end
