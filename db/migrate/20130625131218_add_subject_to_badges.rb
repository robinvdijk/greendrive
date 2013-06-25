class AddSubjectToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :subject, :string
    
  end
end
