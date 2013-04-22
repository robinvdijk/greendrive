class Achievement < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :badges
end
