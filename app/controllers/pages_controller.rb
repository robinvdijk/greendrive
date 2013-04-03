class PagesController < ApplicationController
  def dashboard
  	if current_user
  	else
  		redirect_to new_session_path
  	end
  end
end
