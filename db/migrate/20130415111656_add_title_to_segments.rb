class AddTitleToSegments < ActiveRecord::Migration
  def change
    add_column :segments, :title, :string
  end
end
