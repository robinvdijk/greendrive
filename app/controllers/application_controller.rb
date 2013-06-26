class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
 
  check_authorization
  skip_authorization_check :only => [:root, :download]
  # load_and_authorize_resource
  
  def get_user
    @user = User.where(:user_name => params[:user_name]).first
  end
  
  def get_car
    @car = Car.where('user_id = ?', current_user.id).first
  end
  
  # def get_badges
  #   @badges_electric = Badge.where('user_id = ?', current_user.id)
  #   @badges_mileage = Badge.where('subject = ? and value <= ?', 'Mileage', @car.mileage)
  #   @badges_ratio = Badge.where('subject = ? and value <= ?', 'Mileage Ratio', 100 * @car.mileage_ratio)
  # end

  def search_results
    authorize! :read, :all
    if params[:search].blank?
      @users = User.all    
    else
      if params[:search]
        @users =  User.where("user_name || first_name || last_name LIKE ?", '%' + params[:search] + '%')              
      end  
    end                             
  end

  def current_user
    current_user ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  
  # def user_required
  #   unless current_user.present?
  #     redirect_to new_session_path
  #   end
  # end
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def find_user_by_email
    User.find_by_email(params[:email])
  end

	def root
	  if current_user
      redirect_to user_name_dashboard_path(current_user.user_name)
    else
      redirect_to homepage_path
    end
	end
  
  def download
    send_file(Rails.root.join('public', 'Algemene-voorwaarden.pdf'), :type =>'application/pdf', :disposition => 'inline')

    
  end
  
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.default_message = "U bent niet bevoegd deze pagina te bekijken."
  end
end
