class PagesController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  def dashboard
    
  end
end
