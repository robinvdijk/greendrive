class User < ActiveRecord::Base

  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :clean_data, :password, :user_name, :avatar, :birthday

  has_secure_password 
  before_validation :clean_data
  validates_presence_of :password, :on => :create
  validates_format_of :password, :with => /(?=^.{6,20}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/
  #Password: Minimum 6 characters, maximum 20, waarvan 1 lowercase, 1 uppercase, 1 special character OF getal

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:minimum => 4,:maximum => 20}
  validates :license_plate, :presence => true, :uniqueness => true, :length => {:minimum => 6, :maximum => 6}
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}


  before_create { generate_token(:auth_token) }

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    UserMailer.password_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end



 
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
