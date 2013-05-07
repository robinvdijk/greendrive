class SegmentsController < ApplicationController
  
  def get_license_plate
    @user = User.find(params[:id])
  end
end