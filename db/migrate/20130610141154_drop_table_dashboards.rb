class DropTableDashboards < ActiveRecord::Migration
  def change 
    drop_table :dashboards
  end
end
