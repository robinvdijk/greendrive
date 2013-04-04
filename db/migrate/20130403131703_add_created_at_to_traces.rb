class AddCreatedAtToTraces < ActiveRecord::Migration
  def change
    add_column :traces, :created_at, :datetime
  end
end
