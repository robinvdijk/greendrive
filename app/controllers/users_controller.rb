class UsersController < ApplicationController
  # before_filter :user_required, :except => [:new, :create]
  before_filter :get_user
  
  load_and_authorize_resource
  
  def index
    @users = User.search(params[:search])
  end

  def show
    get_car
  end
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(params[:user])
    @user.role = 'user' #Hoort eigenlijk in model te staan. (hoort bij rollen)
      if @user.save
        cookies[:auth_token] = @user.auth_token
        # UserMailer.welcome_email(@user).deliver (werkt nog niet op vps)
        flash[:succes] = "Welkom " + @user.user_name + ". U ben succesvol ingelogd. Er is tevens een welkomst e-mail verstuurd naar uw e-mailadres."
        redirect_to new_car_path
      else
        flash[:alert] = "Niet alle velden zijn correct ingevuld."
        render :new
      end
  end
  
  def edit
    get_user
  end

  def update
    find_user
    respond_to do |format|
      if @user.update_attributes(params[:user])
       flash[:success] = 'Uw profiel is succesvol aangepast.'
       format.html { redirect_to user_name_path(current_user.user_name) }
      else
       flash[:alert] = 'Er is iets misgegaan. Mogelijk zijn niet alle velden correct ingevuld.'
       format.html { render :edit }
      end       
    end
  end 

  def destroy
    find_user
    # Used to remove connected files (avatar photos) from users
    # @user.remove_file
    # FileUtils.remove_dir("#{Rails.root}/public/uploads/user/avatar/#{@user.id}", :force => true)  
      
    # @user = User.find(params[:id])  
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end
end
 