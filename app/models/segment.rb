class Segment < ActiveRecord::Base
  require 'httparty'
  require 'json' 

  
  has_one :car
  
  attr_accessible :id, :user_id, :title, :auth_token, :company_id, :mileage, :drive_electric_ratio, :created_at, :updated_at, :mileage_electric, :mileage_fossile, :license_plate
  
  belongs_to :user
  
  def self.cron
        
      segment = Segment.new
      segment.init
      segment.getdata
      puts "cronjob finished"
    
  end
  
  def init
     response = HTTParty.get("http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012") 
   
     auth = JSON.parse(response.body)
     self.auth_token = auth['AuthToken']
     self.company_id = auth['CompanyId']
   
     self.save
  end
   

  # response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&max_segment_id=#{self.remote_id}")
    
  def test
    200.times do |i|
      response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=#{i}")
      data = JSON.parse(response2.body)
      puts data
      for segment in data['Segments']
        self.remote_id = segment['ID'] # 239493 
        self.mileage = segment['mileage'] / 1000
        self.drive_electric_ratio = segment['driveElectricRatio']
      end
    end
  end
        
  def getdata
    # response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetNewSegments?token=#{auth_token}&companyId=#{company_id}&page=1")
    # headers 'Content-Type' => "application/json"    
            
    # response2 = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/GetSegmentsInRange?token=#{auth_token}&companyId=#{company_id}&page=1&utc_from=2013-06-10 13:00&utc_to=2013-06-18 13:00")
            
    response = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=#{auth_token}&companyId=#{company_id}&max_segment_id=891542")    
      
    data = JSON.parse(response.body)
    puts data
    
      #<HTTParty::Response:0x..fa parsed_response=-2, @response=#<Net::HTTPOK 200 OK readbody=true>, @headers={"cache-control"=>["private"], "content-length"=>["2"], "content-type"=>["application/json; charset=utf-8"], "server"=>["Microsoft-IIS/7.5"], "x-aspnet-version"=>["4.0.30319"], "x-powered-by"=>["ASP.NET"], "date"=>["Sun, 23 Jun 2013 18:15:48 GMT"], "connection"=>["close"]}>
    
      # response = HTTParty.get("http://360-ev.com/Services/SegmentData.svc/json/MarkAsReceived?token=by93Q1ZJL1hYMDVDb3NhcXZxbjltZ29SdmpoR2djdlhPbzQxREFpTTNja2p1eVZBcEFVOWxnPT01&companyId=13722&max_segment_id=848563")    
    


      
      for segment in data['Segments']
      
    
        
        
        car = Car.where('license_plate = ?', segment['licence_plate']).first
        
        self.remote_id = segment['ID'] # 239493 
        self.mileage = segment['mileage'] / 1000
        self.drive_electric_ratio = segment['driveElectricRatio']
    
        if car     
          if self.mileage > 0
            car.mileage += self.mileage
            
            unless self.drive_electric_ratio == nil
              
              if self.drive_electric_ratio > 0 
                 henk = self.mileage * self.drive_electric_ratio
                           
                 self.mileage_electric = (self.mileage_electric + henk).to_i
                 car.mileage_electric += henk.to_i
                                          
                 henk2 = self.mileage * (1 - self.drive_electric_ratio)
                 self.mileage_fossile = (self.mileage_fossile + henk2).to_i
                 car.mileage_fossile += henk2.to_i
             
                 car.mileage_ratio = 100 * car.mileage_electric / car.mileage

              else
          
                self.mileage_fossile = self.mileage_fossile + self.mileage
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
      

   