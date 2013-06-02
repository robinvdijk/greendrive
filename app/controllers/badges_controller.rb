class BadgesController < ApplicationController
    skip_authorization_check


  def index
    @user = User.where(:user_name => params[:user_name]).first

 # @segment = Segment.find(params[:id])
    @car = Car.where(:user_id => params[:id]).first

  
    @badges_electric = Badge.where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric).limit(1).order('value desc')
    @badges_fossile = Badge.where('subject = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile).limit(1).order('value desc')
    @badges_mileage = Badge.where('subject = ? and value <= ?', 'Mileage', @car.mileage).limit(1).order('value desc')
    @badges_ratio = Badge.where('subject = ? and value <= ?', 'Mileage Ratio', @car.mileage_electric / @car.mileage).limit(1).order('value desc')
    
    
    
  end


  def new
    @badge = Badge.new
    @badges = Badge.all
  end
  
  def create
    @badge = Badge.new(params[:badge])
    if @badge.save
      redirect_to new_badge_path
    else
      render 'new'
    end
  end
  
 
  # 
end