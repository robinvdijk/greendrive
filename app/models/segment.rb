class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json'
  
  def init
   response = HTTParty.get(" http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012") 
   
   auth = JSON.parse(response.body)
   self.auth_token = auth['AuthToken']
   self.company_id = auth['CompanyId']
   puts auth
   self.save
   
   end
 
   def get_new_segment 
   
   response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=7")
   data = JSON.parse(response2.body)
   self.mileage = data['mileage']
   self.drive_electric_ratio = data['driveElectricRatio']
   puts data
   
   self.save
   
  end

end



