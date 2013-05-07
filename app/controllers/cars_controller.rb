class CarsController < ApplicationController
  skip_authorization_check
  
  def new
    @car = Car.new
  end
end
