class DashboardsController < ApplicationController
 load_and_authorize_resource
 before_filter :get_user, :get_car

    
  def index

    begin
    @car_miles = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
    @car_miles_week = { electric: @car.last_week_electric, fossile: @car.last_week_fossile }
    @car_miles_month = { electric: @car.last_month_electric, fossile: @car.last_month_fossile }
    @car_miles_year = { electric: @car.last_year_electric, fossile: @car.last_year_fossile }
    

    rescue ActiveRecord::RecordNotFound
    	redirect_to root_path
    end
  end 
  # bundle exec whenever --update-crontab RAILS_ENV=production
end
