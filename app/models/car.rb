class Car < ActiveRecord::Base
  attr_accessible :company_id, :license_plate, :segment_id, :user_id, :mileage_fossile, :mileage_electric, :username, :model, :password
  
  # belongs_to :user
  belongs_to :segment
  
  
  
end



