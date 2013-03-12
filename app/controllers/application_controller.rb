class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_user
    if session[:user_id]
      User.find session[:user_id]
    else
      false
    end
  end
  
  def user_required
    unless current_user.present?
      redirect_to new_session_path
    end
  end
  
end
