class CarsController < ApplicationController
  skip_authorization_check
  
  def new_car
    @car = Car.new
  end
  
  def new
    new_car
  end

  def create
    new_car(params[:car])
    if @car.save
      flash[:success] = "De auto is succesvol gekoppeld en u bent succesvol ingelogd."
      redirect_to root_path
      username = @car.username 
      password = @car.password
    else
      render 'new'
    end
  end
  
end

