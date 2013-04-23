class Badge < ActiveRecord::Base
  attr_accessible :tier, :value, :avatar
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :achievements
  has_many :users, through: :achievements

end
