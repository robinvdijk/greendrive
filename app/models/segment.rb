class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json' 

  
  has_one :car
  
  attr_accessible :id, :user_id, :title, :auth_token, :company_id, :mileage, :drive_electric_ratio, :created_at, :updated_at, :mileage_electric, :mileage_fossile, :license_plate
  
  belongs_to :user
  
  def self.cron
        
      segment = Segment.new
      segment.init
      segment.mark
      
      segment.getdata
      Achievement.getbadges

      puts "mark finished"
    
  end
  
  def init
     response = HTTParty.get("http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012") 
   
     auth = JSON.parse(response.body)
     self.auth_token = auth['AuthToken']
     self.company_id = auth['CompanyId']
     self.remote_id = Segment.last.remote_id
     self.save
  end
   

  # response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")
    
  def test

      response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")    
      data = JSON.parse(response2.body)
      puts data
      
      
  end

          
  def mark

      
    HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{self.auth_token}&companyId=#{self.company_id}&max_segment_id=#{Segment.last.remote_id}")    
    
  end
  
  def getdata
    
    
      
    response = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=1")            

    data = JSON.parse(response.body)
    puts data
    

    
    self.remote_id = data['MaxID']
    
    
          
      for segment in data['Segments']
      

        
        car = Car.where('license_plate = ?', segment['licence_plate']).first
        
        
        self.mileage = segment['mileage'] / 1000
        self.drive_electric_ratio = segment['driveElectricRatio']
        
    
        if car     
          if self.mileage > 0
            car.mileage += self.mileage
            
            unless self.drive_electric_ratio == nil
              
              if self.drive_electric_ratio > 0 
                 elektrisch = self.mileage * self.drive_electric_ratio
                           

                 car.mileage_electric += elektrisch.to_i
                                          
                 fossiel = self.mileage * (1 - self.drive_electric_ratio)

                 car.mileage_fossile += fossiel.to_i
             
                 car.mileage_ratio = 100 * car.mileage_electric / car.mileage

              else
          

                car.mileage_fossile += self.mileage
              
              end
              
      
              car.save
              self.save
          
            end
  
          end
        end
        
        
      end

      
      


    
    
    
  end
  
  
  
  
  
  
  
  
end
      

   