class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :license_plate
      t.integer :company_id
      t.integer :user_id
      t.integer :segment_id
      t.integer :mileage
      t.integer :mileage_electric
      t.integer :mileage_fossile
      t.timestamps
    end
  end
end
