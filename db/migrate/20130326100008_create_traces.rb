class CreateTraces < ActiveRecord::Migration
  def change
    create_table "traces" do |t|
      t.string   "title"
    end
  end
end
