class RenameTitleColumnToSubject < ActiveRecord::Migration
  def change
    rename_column :badges, :title, :subject
  end
end
