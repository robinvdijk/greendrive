class UsersController < ApplicationController
  before_filter :user_required, :except => [:new, :create]
  
  def index
   @user = User.all
  end
  
  def show
   @user = User.find(params[:id])

  end

  def new
    @user = User.new    
  end
    
  def edit
   @user = User.find(params[:id])
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user, :notice => 'Uw profiel is succesvol aangepast.') }
      else
        format.html  { render :action => "edit" }
      end       
    end
  end  
end
 