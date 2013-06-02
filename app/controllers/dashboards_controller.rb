class DashboardsController < ApplicationController
 load_and_authorize_resource
 before_filter :get_badges
    
  def index
    begin
      @car_miles_week = { electric: @car.last_week_electric, fossile: @car.last_week }
      @car_miles_overall = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
    rescue ActiveRecord::RecordNotFound
    	redirect_to root
    end
  end 
  # bundle exec whenever --update-crontab RAILS_ENV=production
end
