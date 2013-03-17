class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name, :avatar
  has_secure_password
  validates_presence_of :password, :on => :create

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:maximum => 16}
  validates :license_plate, :presence => true, :uniqueness => true, :length => {:minimum => 6, :maximum => 6}
  
  #used to add avatar to user profile
  mount_uploader :avatar, AvatarUploader

end