class Badge < ActiveRecord::Base
  attr_accessible :tier, :value, :avatar, :points, :title, :mileage, :mileage_electric, :mileage_fossile, :description
  mount_uploader :avatar, AvatarUploader

  has_many :achievements
  has_many :users, through: :achievements
  
  default_scope limit(1).order('value desc')
  
  
  # scope :mileage_electric, where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric)
  
  
end
  