class User < ActiveRecord::Base

  attr_accessible :provider, :uid, :role, :email, :first_name, :last_name, :license_plate, :password_confirmation, :clean_data, :password, :user_name, :avatar, :birthday

  has_secure_password 
  has_many :authentications

  validates_presence_of :password, :on => :create
  validates_presence_of :password_confirmation, :on => :create
  validates_format_of :password, :with => /(?=^.{6,20}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/, on: :create
  #Password: Length between 6-20 characters, which consists of [at least] 1 lowercase, 1 uppercase and 1 special character OR digit

  validates :password, :presence => {:on => :create}
                       

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:minimum => 4,:maximum => 20}
  validates :license_plate, :presence => true, :uniqueness => true, :length => {:minimum => 6, :maximum => 6}
  validates :email, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}

  # Dit is voor het registeren form
  validates :terms_of_service, :acceptance => true
  validates :terms_of_privacy, :acceptance => true


  before_create { generate_token(:auth_token) }
  
  before_validation :clean_data #Filters out whitespaces and special characters

  def clean_data
    self.license_plate = self.license_plate.gsub(/[ \-]/, '') unless self.license_plate.nil?
  end

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


  # def self.from_omniauth(auth)
  #   where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
  #     user.provider = auth.provider
  #     user.uid = auth.uid
  #     user.name = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  #     user.save!
  #   end
  # end



  def apply_omniauth(omniauth)
    self.email = omniauth['user_info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  ROLES = %w[admin moderator author banned]
  def role_symbols
      [role.to_sym]
  end


  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r)}.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero?}
  end

end 
