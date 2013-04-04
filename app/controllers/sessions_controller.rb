class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
<<<<<<< HEAD
 
=======
>>>>>>> 27512afb272ff66a1d15da13c3e644f6f467ba91
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
      redirect_to root_url, :notice => "Ingelogd!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to root_url, :notice => "Uitgelogd"
  end
end
