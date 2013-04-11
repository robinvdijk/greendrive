class AddGpsLongitudeToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :gps_longitude, :float
  end
end
