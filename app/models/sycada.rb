class Sycada

  def henk
    HTTParty.get("http://360-ev.com/Services/Authentication.svc/json/Authenticate?username=greenflux2012&password=green2012")
    
    data = JSON.parse(response.body)
    data['AuthToken']
    
  end

end