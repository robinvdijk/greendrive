class ChangeDatetimeFormatInUser < ActiveRecord::Migration
  def self.up
  	change_column :users, :birthday, :date
  end

  def self.down
  	change_column :users, :birthday, :date_time
  end
end
