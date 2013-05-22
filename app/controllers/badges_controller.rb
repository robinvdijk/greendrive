class BadgesController < ApplicationController
    skip_authorization_check
    
  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.new(params[:badge])
    if @badge.save
      redirect_to new_badge_path
    else
      render 'new'
    end
  end

  def show
    @car = Car.find(params[:id])
    
    @badges_electric = Badge.where('title = ? and value <= ?', 'Mileage Electric', @car.mileage_electric / 1000).limit(1).order('value desc')
    @badges_fossile = Badge.where('title = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile / 1000).limit(1).order('value desc')
    @badges_mileage = Badge.where('title = ? and value <= ?', 'Mileage', @car.mileage / 1000).limit(1).order('value desc')
  end
  
end