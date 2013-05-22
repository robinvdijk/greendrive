class PagesController < ApplicationController
 skip_authorization_check

  def dashboard
  	if current_user
  	else
  		redirect_to new_session_path
  	end

  end

  def homepage
  	if current_user
  		redirect_to user_path(current_user)
  	else
  	end
  end
  

end
