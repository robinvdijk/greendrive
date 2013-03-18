class User < ActiveRecord::Base
<<<<<<< HEAD
=======
<<<<<<< HEAD
=======

<<<<<<< HEAD
=======
>>>>>>> afbb336f49197571ffeb8dce4fa0669749f9318a

>>>>>>> 5271968cdfae6772451dd758a6426d96342f58c8
  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name, :avatar, :birthday

 has_secure_password

  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name, :birthday

>>>>>>> 87eb8b7a9b9e61e55200f437e13846bc78e8ed1d
  attr_accessible :email, :first_name, :last_name, :license_plate, :clean_data, :password_confirmation, :password, :user_name, :birthday
  has_secure_password

  validates_presence_of :password, :on => :create
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:maximum => 16}
  validates :license_plate, :presence => true, :uniqueness => true, :length => {:minimum => 6, :maximum => 6}
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  
  #used to add avatar to user profile
  mount_uploader :avatar, AvatarUploader


  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
  

end