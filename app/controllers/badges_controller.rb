class BadgesController < ApplicationController
    skip_authorization_check
    before_filter :get_user, :get_car

  def index  
    @badge_green = Badge.where('theme = ?', 'groen') 
  end
  
  def new
    @badge = Badge.new
  end
  
  def create
    @badge = Badge.new(params[:badge])
    if @badge.save
      redirect_to new_badge_path
    else
      render 'new'
    end
  end
  
  def find_green
    select(:badges, :theme, 'algemeen')

  end
  
  def find_general
    Badge.where('theme = ?', 'algemeen')
  end

end


# <%= raw current_user.badges.electric.map {|badge| image_tag badge.avatar_url(), :class => "badge_display" }.to_sentence %>
