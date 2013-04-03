class AddLicencePlateToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :licence_plate, :string
  end
end
