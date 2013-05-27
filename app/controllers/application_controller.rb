class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
 
  skip_authorization_check

  def search_results
    if params[:search].blank?
      @users = User.all    
    else
      if params[:search]
        @users =  User.where("email LIKE ?", '%' + params[:search] + '%')              
      end  
    end                             
  end

  def current_user
    current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  def user_required
    unless current_user.present?
      redirect_to new_session_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :error => exception.default_message = "U bent niet bevoegd deze pagina te bekijken."
  end
end
