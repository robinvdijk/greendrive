class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  check_authorization
  
  def current_user
    current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def user_required
    unless current_user.present?
      redirect_to new_session_path
    end
  end
  
  def json
    @miles = :id
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :notice => exception.default_message = "U bent niet bevoegd deze pagina te bekijken."
  end
end
