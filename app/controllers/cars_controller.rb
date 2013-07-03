class CarsController < ApplicationController
  skip_authorization_check
  before_filter :get_user
  
  def new
    @car = Car.new  
  end

  def create
    @car = Car.new(params[:car])
    if @car.save
      flash[:success] = "De auto is succesvol gekoppeld en u bent succesvol ingelogd."

      redirect_to user_name_dashboard_path(current_user.user_name, first_visit: true)

      username = @car.username 
      password = @car.password
      
      Achievement.getbadges
    else
      render 'new'
    end
  end
  
end

