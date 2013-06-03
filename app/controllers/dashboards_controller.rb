class DashboardsController < ApplicationController
 load_and_authorize_resource
 before_filter :get_badges
    
  def index

    begin
    @car_miles = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
    @car_miles_week = { electric: @car.last_week_electric, fossile: @car.last_week_fossile }
    @car_miles_month = { electric: @car.last_month_electric, fossile: @car.last_month_fossile }
    
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
