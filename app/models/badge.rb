class Badge < ActiveRecord::Base
  attr_accessible :tier, :value, :avatar, :points, :title, :mileage, :mileage_electric, :mileage_fossile, :description, :subject, :theme
  mount_uploader :avatar, AvatarUploader

  has_many :achievements
  has_many :users, through: :achievements
  
  # default_scope limit(1)
  

  
  scope :green, where(:theme => 'groen')
  scope :electric, where(:subject => 'mileage_electric').limit(1).order('created_at desc')
  scope :ratio, where(:subject => 'mileage_ratio').limit(1).order('created_at desc')
  scope :mileage, where(:subject => 'mileage').limit(1).order('created_at desc')
  scope :world, where(:subject => 'around_the_world').limit(1).order('created_at desc')
  scope :tutorial, where(:subject => 'tutorial').limit(1).order('created_at desc')
  
  
  
  scope :most_recent, order("created_at desc").limit(3)

  
  # scope :mileage_electric, where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric)
  
  
end
  