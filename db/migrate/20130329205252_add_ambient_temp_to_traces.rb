class AddAmbientTempToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :ambient_temp, :float
  end
end
