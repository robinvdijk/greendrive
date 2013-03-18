class User < ActiveRecord::Base
<<<<<<< HEAD

  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name, :avatar

  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name, :birthday
=======
  attr_accessible :email, :first_name, :last_name, :license_plate, :clean_data, :password_confirmation, :password, :user_name, :birthday
>>>>>>> 57251396a4be6237092dda24d882bfbc3ca0b111
  has_secure_password
  validates_presence_of :password, :on => :create

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:maximum => 16}
  validates :license_plate, :presence => true, :uniqueness => true, :length => {:minimum => 6, :maximum => 6}

<<<<<<< HEAD
  
  #used to add avatar to user profile
  mount_uploader :avatar, AvatarUploader

=======
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
  
>>>>>>> a59135dc9cd67b8558a6a18f01904048bd6a1255
end