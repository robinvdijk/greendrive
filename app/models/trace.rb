class Trace < ActiveRecord::Base
  belongs_to :user 
  require 'httparty'
  
  def init_2
    auth = {username: "greenflux2012", password: "green2012"}
    response = HTTParty.get('http://360-ev.com/Services/Authentication.svc/json/Authenticate?', basic_auth: auth)
    
  end
  
  def fetch
    client = Savon.client(wsdl: "http://www.mysycada.com/mbox/services/Tracing.asmx?WSDL")
    response = client.call(:get_last_trace_of_device_with_licence_plate, xml: '<env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://sycada.com/ws/Tracing/1.0" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ins0="http://sycada.com/entities/authentication/user/1.0" xmlns:ins1="http://sycada.com/entities/common/simpledatetimerange/1.0" xmlns:ins2="http://sycada.com/entities/common/simpledatetime/1.0" xmlns:ins3="http://sycada.com/entities/common/pager/1.0"><env:Body><tns:GetLastTraceOfDeviceWithLicencePlate><ins0:User><ins0:ID>6749</ins0:ID><ins0:CompanyDataID>13722</ins0:CompanyDataID></ins0:User><tns:LicencePlate>81-TRR-8</tns:LicencePlate></tns:GetLastTraceOfDeviceWithLicencePlate></env:Body></env:Envelope>')
<<<<<<< HEAD

=======
    if response.success?
      data = response.to_hash[:get_last_trace_of_device_with_licence_plate_response][:get_last_trace_of_device_with_licence_plate_result][:last_trace]
      if data 
         self.title = data[:title]
         self.gps_longitude = data[:gps_longitude]
         self.gps_latitude = data[:gps_latitude]
         self.licence_plate = data[:licence_plate]
         puts data
      end
    end
>>>>>>> 2a515d684687578d80a1e0f6304315596a37c0cc
    if response.success?
      data = response.to_hash[:get_last_trace_of_device_with_licence_plate_response][:get_last_trace_of_device_with_licence_plate_result][:last_trace][:domain_specific][:domain_data][:ds_domain_data][0][:property_data][:ds_property_data][0]
      if data 
        self.battery_value = data[:value]
        puts data 
      end
    end
    if response.success?
        data = response.to_hash[:get_last_trace_of_device_with_licence_plate_response][:get_last_trace_of_device_with_licence_plate_result][:last_trace][:domain_specific][:domain_data][:ds_domain_data][0][:property_data][:ds_property_data][6]
        if data 
          self.ambient_temp = data[:value]
          puts data 
          self.save
        end
      end
  end
    
  def fetch_time
    client = Savon.client(wsdl: "http://www.mysycada.com/mbox/services/Tracing.asmx?WSDL")
    response = client.call(:get_last_trace_of_device_with_licence_plate, xml: '<env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://sycada.com/ws/Tracing/1.0" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ins0="http://sycada.com/entities/authentication/user/1.0" xmlns:ins1="http://sycada.com/entities/common/simpledatetimerange/1.0" xmlns:ins2="http://sycada.com/entities/common/simpledatetime/1.0" xmlns:ins3="http://sycada.com/entities/common/pager/1.0"><env:Body><tns:GetLastTraceOfDeviceWithLicencePlate><ins0:User><ins0:ID>6749</ins0:ID><ins0:CompanyDataID>13722</ins0:CompanyDataID></ins0:User><tns:LicencePlate>81-TRR-8</tns:LicencePlate></tns:GetLastTraceOfDeviceWithLicencePlate></env:Body></env:Envelope>')

  end
  
  def authenticate
    response = @client.call(:authenticate, message: {username: 'greenflux2012', password: 'green2012'})
    response.hash[:envelope][:body][:authenticate_response][:user]
  end

  def get_last_trace_of_device_with_licence_plate
    response = client.call(:get_last_trace_of_device_with_licence_plate, xml: '<env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:tns="http://sycada.com/ws/Tracing/1.0" xmlns:env="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ins0="http://sycada.com/entities/authentication/user/1.0" xmlns:ins1="http://sycada.com/entities/common/simpledatetimerange/1.0" xmlns:ins2="http://sycada.com/entities/common/simpledatetime/1.0" xmlns:ins3="http://sycada.com/entities/common/pager/1.0"><env:Body><tns:GetLastTraceOfDeviceWithLicencePlate><ins0:User><ins0:ID>6749</ins0:ID><ins0:CompanyDataID>13722</ins0:CompanyDataID></ins0:User><tns:LicencePlate>81-TRR-8</tns:LicencePlate></tns:GetLastTraceOfDeviceWithLicencePlate></env:Body></env:Envelope>')
  end
end