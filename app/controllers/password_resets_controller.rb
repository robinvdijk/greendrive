class PasswordResetsController < ApplicationController
  skip_authorization_check
  before_filter :find_user_by_password_reset_token, :only => [:edit, :update]
  
  def new
  
  end
  
  def find_user_by_password_reset_token
    @user = User.find_by_password_reset_token!(params[:id])
  end
  
  def create     
    if user = find_user_by_email
      user.generate_password_reset
      UserMailer.password_reset(user).deliver
      redirect_to({controller: :sessions, action: :new}, :flash => {:success => "Er is een e-mail verstuurd met instructies om het wachtwoord opnieuw in te stellen."})
    else
      redirect_to({:action => :new}, {:alert => "De e-mail komt niet overeen met een gebruiker."})
    end
  end
  
  def edit
  end

  def update
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Het opnieuw instellen van uw wachtwoord is verlopen."
    elsif @user.update_attributes(params[:user])
      cookies[:auth_token] = @user.auth_token
      redirect_to(@user, :success => "Uw wachtwoord is opnieuw ingesteld en u bent succesvol ingelogd.")
    else
      render :edit
    end
  end
  
end
