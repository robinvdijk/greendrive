class AddMileageFossileToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :mileage_fossile, :integer
  end
end
