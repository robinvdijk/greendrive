class CarsController < ApplicationController
  skip_authorization_check
  
  def new
    @car = Car.new
  end

  
  def create
    @car = Car.new(params[:car])
    
    if @car.save
      flash[:success] = "De auto is succesvol gekoppeld en u bent succesvol ingelogd."
      redirect_to root_path
    else
      render 'new'
    end
    
  end
  
end

