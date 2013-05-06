class UsersController < ApplicationController
  before_filter :user_required, :except => [:new, :create]

  load_and_authorize_resource
  
  def index
   @users = User.all
  end
  
  def show
   @user = User.find(params[:id])
<<<<<<< HEAD
  end
=======
   @trace = Trace.find(params[:id])
   @segment = Segment.find(params[:id])
   @miles = { electric: @segment.mileage_electric, fossile: @segment.mileage_fossile }
   @battery = { battery_value: @trace.battery_value, created_at: @trace.created_at }
>>>>>>> da952d9f57e3b78b233a795a68f2a0ae88a41571

   
   @badges_electric = Badge.where(title: 'Mileage Electric').where('value <= ?', @segment.mileage_electric).limit(1).order('value desc')
   @badges_fossile = Badge.where(title: 'Mileage Fossile').where('value <= ?', @segment.mileage_fossile).limit(1).order('value desc')
  end
  
  def new
    @user = User.new
  end
    
  def create
    @user = User.new(params[:user])
    @user.role = 'user' #Hoort eigenlijk in model te staan.
    if @user.save
      flash[:notice] = "Welcome"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
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

  def destroy
    @user = User.find(params[:id])
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
 