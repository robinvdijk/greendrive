class UsersController < ApplicationController
  before_filter :user_required, :except => [:new, :create]
  
  def index
   
  end
  
  def show
    @user = User.find(params[:id])    
  end

  def new
    @user = User.new
    render :layout => 'login'       
  end
    
  def edit
    @user = User.find(params[:id])    
  end
  
  def create
    @user = User.new(params[:user])
    
    respond_to do |format|
      if @user.save
        format.html  { redirect_to(new_session_path) }
        flash[:success] = "U bent succesvol geregistreerd."     
      else
        format.html  { render :action => "new" }
      end
    end    
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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end  
end
 