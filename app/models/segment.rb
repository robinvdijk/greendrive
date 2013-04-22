class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json'
  
  attr_accessible :id, :user_id, :title, :auth_token, :company_id, :mileage, :drive_electric_ration, :created_at, :updated_at, :mileage_electric, :mileage_fossile, :license_plate
  
  belongs_to :user
  
  def init
   response = HTTParty.get("http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012") 
   
   auth = JSON.parse(response.body)
   self.auth_token = auth['AuthToken']
   self.company_id = auth['CompanyId']
   puts auth
   self.save
 end
   
 def test


   response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=1")
   data = JSON.parse(response2.body)
   

   self.license_plate = data['Segments'][1]['licence_plate']
   puts data
   self.save
 end
   
   def get_new_segment 
     9999.times do |i|
       response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=#{i}")
       data = JSON.parse(response2.body)
   
       for segment in data["Segments"]
           self.max_segment_id = segment['ID']
           self.mileage = segment['mileage']
           self.drive_electric_ratio = segment['driveElectricRatio']
           self.license_plate = segment['licence_plate']
           puts data
           
           if self.license_plate == '81-TRR-8'
   
             if self.mileage > 0  
               if self.drive_electric_ratio == 1
                 if self.mileage_electric == nil
                   self.mileage_electric = self.mileage  
                 else
                   self.mileage_electric = self.mileage  + self.mileage_electric
                 end
               elsif self.drive_electric_ratio > 0 && self.drive_electric_ratio < 1
                 henk = self.mileage * 0,25
                 
                 self.mileage_fossile = self.mileage * (1 - henk)
               end
             end
             
           
           end
             
   
           self.save
       end
      if data.blank?
        break
      end
    end
  end

end



