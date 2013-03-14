class User < ActiveRecord::Base
  
  has_many :authentications, :dependent => :delete_all
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :user_name, :license_plate
  # attr_accessible :title, :body
  
  #omniauth, authentication with facebook attributes
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

  def to_key
   new_record? ? nil : [ self.send(self.class.primary_key) ]
  end
  
  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
      self.email = auth['extra']['raw_info']['email']
      # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
      authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end
end
