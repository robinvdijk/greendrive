class DashboardsController < ApplicationController
 load_and_authorize_resource
 before_filter :get_user, :get_car

    
  def index

    begin
    @car_miles = { electric: @user.car.mileage_electric, fossile: @user.car.mileage_fossile }
    @car_miles_week = { electric: @user.car.last_week_electric, fossile: @user.car.last_week_fossile }
    @car_miles_month = { electric: @user.car.last_month_electric, fossile: @user.car.last_month_fossile }
    @car_miles_year = { electric: @user.car.last_year_electric, fossile: @user.car.last_year_fossile }
    

    rescue ActiveRecord::RecordNotFound
    	redirect_to root_path
    end
  end 
  # bundle exec whenever --update-crontab RAILS_ENV=production
end
