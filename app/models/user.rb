class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :license_plate, :password_confirmation, :password, :user_name
  has_secure_password
  validates_presence_of :password, :on => :create

end