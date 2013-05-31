class Leaderboard < ActiveRecord::Base
  attr_accessible :user_id, :score, :user_name, :mileage_fossile, :mileage_electric, :mileage, :sortable, :sort
  
end
