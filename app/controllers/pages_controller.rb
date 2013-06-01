class PagesController < ApplicationController
 skip_authorization_check :only => [:homepage]

	def dashboard
		unless current_user
			redirect_to new_session_path
		end
	end
 	
 	def homepage
 		if current_user
 			redirect_to user_path(current_user)
 		end
 	end
end
