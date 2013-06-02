class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :get_user_and_car, :get_badges
 
  check_authorization
  skip_authorization_check :only => [:root]
  # load_and_authorize_resource
  
  def get_user_and_car
    @user = User.where(:user_name => params[:user_name]).first
    @car = Car.where(:user_id => params[:id]).first
  end
  
  def get_badges
    @badges_electric = Badge.where('subject = ? and value <= ?', 'Mileage Electric', @car.mileage_electric).one_and_highest
    @badges_fossile = Badge.where('subject = ? and value <= ?', 'Mileage Fossile', @car.mileage_fossile).one_and_highest
    @badges_mileage = Badge.where('subject = ? and value <= ?', 'Mileage', @car.mileage).one_and_highest
    @badges_ratio = Badge.where('subject = ? and value <= ?', 'Mileage Ratio', 100 * @car.mileage_electric / @car.mileage).one_and_highest
  end

  def search_results
    authorize! :read, :all
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
  
  # def user_required
  #   unless current_user.present?
  #     redirect_to new_session_path
  #   end
  # end

  def new_user
    @user = User.new
  end
  
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
      redirect_to login_path
		end
	end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.default_message = "U bent niet bevoegd deze pagina te bekijken."
  end
end
