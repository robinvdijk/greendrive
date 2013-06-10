class DropIntervals < ActiveRecord::Migration
  def change
    drop_table :intervals
  end
end
