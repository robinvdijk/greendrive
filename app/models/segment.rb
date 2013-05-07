class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json'
  
  attr_accessible :id, :user_id, :title, :auth_token, :company_id, :mileage, :drive_electric_ration, :created_at, :updated_at, :mileage_electric, :mileage_fossile
  
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
   
 end
   
   def get_new_segment 
     9999.times do |i|
       response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=#{i}")
       data = JSON.parse(response2.body)
   
       for segment in data["Segment"]
           self.max_segment_id = segment['ID']
           self.mileage = segment['mileage']
           self.drive_electric_ratio = segment['driveElectricRatio']
           puts data

           self.save
   
           if self.mileage > 0 
             if self.drive_electric_ratio == 1
               if self.mileage_electric == nil
                 self.mileage_electric = self.mileage  
               else
                 self.mileage_electric = self.mileage  + self.mileage_electric
               end
             else
               self.mileage_fossile = self.mileage
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



