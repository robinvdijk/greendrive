class AddGpsLatitudeToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :gps_latitude, :float
  end
end
