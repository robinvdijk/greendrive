class SessionsController < ApplicationController
  skip_authorization_check

  def index
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
        redirect_to root_url
        flash[:success] = "U bent succesvol ingelogd."
    else
      flash[:notice] = "E-mailadres en wachtwoord komen niet overeen."
      redirect_to new_session_path
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url
  end
end
