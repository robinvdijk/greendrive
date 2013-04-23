class Badge < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :achievements
  has_many :users, through: :achievements

end
