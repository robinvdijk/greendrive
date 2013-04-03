class AddTimeToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :date, :datetime
    add_column :traces, :hour, :time
    add_column :traces, :minute, :time
    add_column :traces, :second, :time
  end
end
