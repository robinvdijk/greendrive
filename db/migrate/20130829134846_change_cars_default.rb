class ChangeCarsDefault < ActiveRecord::Migration
  def change
    change_column_default :cars, :last_week, 0
    change_column_default :cars, :last_month, 0
  end
end