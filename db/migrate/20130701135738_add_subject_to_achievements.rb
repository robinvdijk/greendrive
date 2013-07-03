class AddSubjectToAchievements < ActiveRecord::Migration
  def change
    add_column :achievements, :subject, :string
  end
end
