class SessionsController < ApplicationController
   skip_authorization_check
  # load_and_authorize_resource
  # skip_authorize_resource :only => :new

  def index
    root
  end

  def new
    unless current_user
      new_user
    else
      root
    end
  end

  def create
    user = find_user_by_email
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
        root
        flash[:success] = "U bent succesvol ingelogd."
    else
      flash[:alert] = "E-mailadres en wachtwoord komen niet overeen."
      redirect_to new_session_path
    end
  end
  
  def destroy
    cookies.delete(:auth_token)
    root
  end
  
  # def new_facebook
  #   @user = User.new
  # end
  
  # def form_facebook
  #   redirect_to 'users#form_facebook'
  # end
  
  # def create_facebook
  #   user = User.from_omniauth(env["omniauth.auth"])
    
  #   if user.password_digest.nil?
  #     user.password = SecureRandom.base64(8)
  #     user.password_confirmation = user.password
    
  #     if user.license_plate.nil?
  #       user.license_plate = SecureRandom.hex(3)
      
  #     flash[:success] = "U account is succesvol aangemaakt met facebook. 
  #                       Uw tijdelijke wachtwoord en kenteken is #{user.password} en #{user.license_plate}, 
  #                       u wordt aangeraden direct deze gegevens naar believen aan te passen. Klik op Mijn Profiel en Vervolgens op bewerken om dez wijzegingen uit te voren."
  #       end
  #   end
    
  #   user.save!
  #   cookies[:auth_token] = user.auth_token
  #   redirect_to root_path
  # end
  
  # def create_facebook_session
  #   user = User.from_omniauth(env["omniauth.auth"])
  #   cookies[:auth_token] = user.auth_token
  #   flash[:success] = 'U bent succeslvol ingelogt met '
  # end

end
