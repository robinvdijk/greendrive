class DashboardsController < ApplicationController
 load_and_authorize_resource
    

  def index
    begin
    @user = User.where(:user_name => params[:user_name]).first

    @car = Car.where(:user_id => params[:id]).first

    

    @car_miles_week = { electric: @car.last_week_electric, fossile: @car.last_week }
    
    @car_miles_overall = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
      
    @badges_electric = Badge.where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric).limit(1).order('value desc')
    @badges_fossile = Badge.where('subject = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile).limit(1).order('value desc')
    @badges_mileage = Badge.where('subject = ? and value <= ?', 'Mileage', @car.mileage).limit(1).order('value desc')
    @badges_ratio = Badge.where('subject = ? and value <= ?', 'Mileage Ratio', 100 * @car.mileage_electric / @car.mileage).limit(1).order('value desc')
    
    rescue ActiveRecord::RecordNotFound
    	redirect_to root_path
    end
  
  end

  # bundle exec whenever --update-crontab RAILS_ENV=production
  
end
