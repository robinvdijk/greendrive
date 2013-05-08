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
  
end