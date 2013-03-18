class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by_email(params[:email])
    
    if user && user.authenticate(params[:password])
      if params[:remember_me] == 'true'
        # user.refresh_remember_token
        # cookies[:auth_token] = { :value => user.remember_token, :expires => 2.weeks.from_now }
      end      
      flash[:success] = 'U bent succesvol ingelogd!'
      session[:user_id] = user.id
      #cookies[:login] = { :value => "ingelogd", :expires => Time.now + 3600*24*7*52}
      redirect_to root_path
    else
      flash[:notice] = 'Uw ingevoerde gegevens komen niet overeen met onze database.'
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
