class Badge < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :achievement
end
