class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :license_plate, :password, :password_confirmation, :user_name
end
