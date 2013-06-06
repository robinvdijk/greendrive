class Car < ActiveRecord::Base
  attr_accessible :company_id, :license_plate, :segment_id, :user_id, :mileage_fossile, :mileage_electric, :username, :model, :password, :last_week, :last_month
  
  belongs_to :user

  validates :username, :presence => true, :uniqueness => true
  validates :password, :presence => true
  validates :license_plate, :presence => true, :uniqueness => true
  validates :model, :presence => true
end



