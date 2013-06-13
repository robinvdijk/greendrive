class LeaderboardsController < ApplicationController
	load_and_authorize_resource
	helper_method :sort_column, :sort_direction, :get_car_2
	def index
		@cars = Car.order(sort_column + " " + sort_direction).limit(10)
    @points_current = current_user.badges.map {|badge| badge.points}
	end

	private 
	#If you remove the extra information in the URL and set it to /leaderboards it will raise an error
	#because there is no sorting for a default case.
	#Using these private methods it will default the column sorting to ascending user_name
	#The "include?"-part is there because when a user manually changed the sortquery in the URL to
	#something that doesn't exist, the app wil not crash. Instead, it refers back to the default.
	def sort_column
    Car.column_names.include?(params[:sort]) ? params[:sort] : "score"

	end

	def sort_direction
		%w[desc].include?(params[:direction]) ? params[:direction] : "desc"
	end
end



