class Car < ActiveRecord::Base
  attr_accessible :company_id, :license_plate, :segment_id, :user_id, :mileage_fossile, :mileage_electric, :username, :model, :password
  
  belongs_to :user
  # belongs_to :segment
  
  # validates :license_plate, :presence => true, :uniqueness => true
#   validates :username, :presence => true
#   validates :password, :presence => true
  
  
  
end



