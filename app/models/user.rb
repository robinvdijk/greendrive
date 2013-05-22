class User < ActiveRecord::Base
  
  attr_accessible :provider, :rank, :terms_of_service, :image_cache, :terms_of_privacy, :uid, :role, :admin, :user, :email, :first_name, :middle_name, :last_name, :password_confirmation, :password, :user_name, :avatar, :birthday
  has_secure_password 

  has_many :authentications
  has_many :traces

  has_one :car
  has_one :dashboard

  has_many :segments
  
  has_many :achievements
  has_many :badges, through: :achievements



  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_format_of :password, :with => /(?=^.{6,20}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$/
  #Password: Length between 6-20 characters, which consists of [at least] 1 lowercase, 1 uppercase and 1 special character OR digit
  
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :user_name, :presence => true, :uniqueness => true, :length => {:minimum => 4,:maximum => 20}
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :terms_of_service, :acceptance => {:accept => true}
  validates :terms_of_privacy, :acceptance => {:accept => true}
  
  before_create { generate_token(:auth_token) }
  mount_uploader :avatar, AvatarUploader

  after_validation { self.errors.messages.delete(:password_digest) } 
  # ^ This way password_digest won't show up in the errorlog

  

  ##### /users/id wordt /users/username ####
  # extend FriendlyId
  # friendly_id :user_name

#### REMOVES WHITESPACE AND DASHES FROM LICENSE PLATE INPUT ####

  before_create { generate_token(:auth_token) }
  


  
####################


  # ------------------------------------
  # Forgot Password
  # ------------------------------------
  def generate_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!(validate: false) #This way password validation wont conflict
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while User.exists?(column => self[column])
  end

  
  # ------------------------------------

  #used to add avatar to user profile
  


  def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
          if user.created_at.nil?
            user.created_at = Time.now
          end
          if user.oauth_token.nil?
            user.oauth_token = auth.credentials.token
          end
          if user.oauth_expires_at.nil?
            user.oauth_expires_at = Time.at(auth.credentials.expires_at)
          end       
        user.provider = auth.provider
        user.uid = auth.uid
        user.first_name = auth.info.first_name
        user.last_name = auth.info.last_name
        user.user_name = auth.info.name
        user.avatar = auth.info.image
        user.email = auth.extra.raw_info.email
      end
  end


#### FACEBOOK OMNIAUTH ####
  def apply_omniauth(omniauth)
    Rails.logger.info omniauth['info']['email']
    self.email = omniauth['info']['email'] if email.blank?
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end
############################

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end


#### ROLES USED WITH CANCAN ####
  ROLES = %w[admin user]
  def role_symbols
      [role.to_sym]
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r)}.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero?}
  end

 ################################



end 
