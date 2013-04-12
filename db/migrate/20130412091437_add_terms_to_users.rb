class AddTermsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :terms_of_service, :boolean
    add_column :users, :terms_of_privacy, :boolean
  end
end
