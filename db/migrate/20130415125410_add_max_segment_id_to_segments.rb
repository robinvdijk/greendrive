class AddMaxSegmentIdToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :max_segment_id, :integer
  end
end
