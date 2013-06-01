class CreateIntervals < ActiveRecord::Migration
  def change
    create_table :intervals do |t|

      t.timestamps
    end
  end
end
