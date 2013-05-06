class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json'  
  
  has_one :car
  
  attr_accessible :id, :user_id, :title, :auth_token, :company_id, :mileage, :drive_electric_ration, :created_at, :updated_at, :mileage_electric, :mileage_fossile, :license_plate
  
  belongs_to :user
  
  def init
   response = HTTParty.get("http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012") 
   
   auth = JSON.parse(response.body)
   self.auth_token = auth['AuthToken']
   self.company_id = auth['CompanyId']
   
   self.save
 end
   
<<<<<<< HEAD
   end
 
   def getnewsegment 
   
     109.times do |i|
       response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=#{i}")
       data = JSON.parse(response2.body)

       for segment in data['Segments']

         # car = Car.where('license_plate = ?', segment['licence_plate'])

         self.remote_id = segment['ID'] # 239493 
         self.mileage = segment['mileage']
         self.drive_electric_ratio = segment['driveElectricRatio']
         self.license_plate = segment['licence_plate']
     
         
         if self.mileage > 0 
           if self.drive_electric_ratio == 1
             if self.mileage_electric == nil
               self.mileage_electric = self.mileage
               # car.mileage_electric += self.mileage
             else
               self.mileage_electric = self.mileage_electric + self.mileage
               # car.mileage_electric += self.mileage
             end
           else
             self.mileage_fossile = self.mileage
             # car.mileage_fossile += self.mileage
           end
         end

         # car.save

         self.save
       end

         # HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")
    end
       
       
       

       # self.remote_id = data['Segments'][499]['ID'] # 239493 
       # self.mileage = data['Segments'][499]['mileage']
       # self.drive_electric_ratio = data['Segments'][499]['driveElectricRatio']
       # puts data
       #    
       # self.save
       # 
       # HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")

  end
     
     def henk 
 
       40.times do |i|
         response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=#{i}")
         data = JSON.parse(response2.body)

         for segment in data['Segments']
           
           car = Car.where('license_plate = ?', segment['licence_plate']).first
           
           self.remote_id = segment['ID'] # 239493 
           self.mileage = segment['mileage']
           self.drive_electric_ratio = segment['driveElectricRatio']
           
            
           
             if self.mileage > 0
               if self.drive_electric_ratio > 0
                  henk = self.mileage * self.drive_electric_ratio
                                  
                  self.mileage_electric = (self.mileage_electric + henk).to_i
                  car.mileage_electric += henk.to_i
                                                 
                  henk2 = self.mileage * (1 - self.drive_electric_ratio)
                  self.mileage_fossile = (self.mileage_fossile + henk2).to_i
                  car.mileage_fossile += henk2.to_i
                  

               else
                 
                 self.mileage_fossile = self.mileage_fossile + self.mileage
                 
                 car.mileage_fossile += self.mileage
               end
             
               car.save
             
               self.save
             end
           end
    
       
         
         if data.blank?
           break
         end
       end
       
   # response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=7")
   # data = JSON.parse(response2.body)
   # self.remote_id = data['Segments'][499]['ID'] # 239493 
   # self.mileage = data['Segments'][499]['mileage']
   # self.drive_electric_ratio = data['Segments'][499]['driveElectricRatio']
   # puts data
   # 
   # self.save

 # HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")
   
   end
   
#    def getmarktasreceived
#      
#      response3 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=[token]&companyId=#{company_id}&max_segment_id=[max_segment_id]
# ")
#    end
   
  
=======
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

>>>>>>> da952d9f57e3b78b233a795a68f2a0ae88a41571
end




