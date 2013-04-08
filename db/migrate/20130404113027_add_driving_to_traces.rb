class AddDrivingToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :electric, :float
    add_column :traces, :fossile, :float
  end
end
