class CarsController < ApplicationController
  skip_authorization_check
  
  def new
    @car = Car.new  
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      flash[:success] = "De auto is succesvol gekoppeld en u bent succesvol ingelogd."
      username = @car.username 
      password = @car.password
    else
      render 'new'
    end
  end
  
end

