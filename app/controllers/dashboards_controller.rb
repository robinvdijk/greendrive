class DashboardsController < ApplicationController
    skip_authorization_check
    
  def index
    @user = User.find(params[:user_id])
    @car = Car.find(params[:user_id])
    

    
    @car_miles = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
  
    @badges_electric = Badge.where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric).limit(1).order('value desc')
    @badges_fossile = Badge.where('subject = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile).limit(1).order('value desc')
    @badges_mileage = Badge.where('subject = ? and value <= ?', 'Mileage', @car.mileage).limit(1).order('value desc')
    @badges_ratio = Badge.where('subject = ? and value <= ?', 'Mileage Ratio', 100 * @car.mileage_electric / @car.mileage).limit(1).order('value desc')
    
  end

  # bundle exec whenever --update-crontab RAILS_ENV=production
  
end
