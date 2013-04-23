class Achievement < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :badge
  belongs_to :user
end
