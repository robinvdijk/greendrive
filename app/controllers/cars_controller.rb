class CarsController < ApplicationController
  skip_authorization_check
  
  def new
    @car = Car.new
  end
  
  def create
    @car = Car.new(params[:car])
    
    if @car.save
      flash[:notice] = "Auto is succesvol gekoppeld"
      redirect_to root_url
    else
      render 'new'
    end
    
  end
  
end