class ChangeSegmenten < ActiveRecord::Migration
  def change
    change_column :segments, :drive_electric_ratio, :float
  end
end
