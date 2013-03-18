class UsersController < ApplicationController
  before_filter :user_required, :except => [:new, :create]
  
  UserMailer.password_reset(@user).deliver
  

  
  def index
   @users = User.all
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
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end
  
  def update
    @user = User.find(params[:id])
    
    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user, :notice => 'Uw profiel is succesvol aangepast.') }
      else
        format.html  { render :action => "edit", :notice => 'Er is iets misgegaan. Mogelijk zijn niet alle velden correct ingevuld.' }

      end       
    end
  end  
end
 