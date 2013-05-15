require 'segment'
class DashboardsController < ApplicationController
    skip_authorization_check
    
  def index
    @user = User.find(params[:user_id])
    @car = Car.find(params[:user_id])
    
    @car_miles = { electric: @car.mileage_electric, fossile: @car.mileage_fossile }
    
    @badges_electric = Badge.where('title = ? and value <= ?', 'Mileage Electric', @car.mileage_electric / 1000).limit(1).order('value desc')
    @badges_fossile = Badge.where('title = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile / 1000).limit(1).order('value desc')
    @badges_mileage = Badge.where('title = ? and value <= ?', 'Mileage', @car.mileage / 1000).limit(1).order('value desc')
  end
end
