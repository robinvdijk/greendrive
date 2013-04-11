class PagesController < ApplicationController
 skip_authorization_check
  def dashboard
<<<<<<< HEAD
  	
  	if current_user
  	else
  		redirect_to new_session_path
  	end
=======
    if current_user
    else
      redirect_to new_session_path
    end
>>>>>>> 2a515d684687578d80a1e0f6304315596a37c0cc
  end
end
