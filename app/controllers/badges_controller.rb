class BadgesController < ApplicationController
    skip_authorization_check

  def index
    get_user_and_car
    get_badges    
  end
  
  def new_badge
    @badge = Badge.new   
  end
  
  def new
    new_badge
    @badges = Badge.all
  end
  
  def create
    new_badge(params[:badge])
    if @badge.save
      redirect_to new_badge_path
    else
      render 'new'
    end
  end

end