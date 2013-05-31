class Badge < ActiveRecord::Base
  attr_accessible :tier, :value, :avatar, :points, :title, :mileage, :mileage_electric, :mileage_fossile, :description
  
  mount_uploader :avatar, AvatarUploader
  
  has_many :achievements
  has_many :users, through: :achievements

end
  