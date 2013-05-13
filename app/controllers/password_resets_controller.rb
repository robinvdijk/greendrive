class PasswordResetsController < ApplicationController
  skip_authorization_check
  def new
  
  end
  
  def create     
    if user = User.find_by_email(params[:email])
      user.generate_password_reset
      UserMailer.password_reset(user).deliver
      redirect_to({controller: :sessions, action: :new}, {:notice => "Er is een e-mail verstuurd met instructies om het wachtwoord opnieuw in te stellen."})
    else
      redirect_to({:action => :new}, {:notice => "De e-mail komt niet overeen met een gebruiker."})
    end
  end
  
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => "Het opnieuw instellen van uw wachtwoord is verlopen."
    elsif @user.update_attributes(params[:user])
      cookies[:auth_token] = @user.auth_token
      redirect_to(@user, :notice => "Uw wachtwoord is gereset en u bent succesvol ingelogd.")
    else
      render :edit
    end
  end
  
end
