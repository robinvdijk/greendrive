class UsersController < ApplicationController
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

  end

  def update
    @user = User.find(params[:id])
     respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html  { redirect_to(@user) }
        flash[:success] = "Het profiel is succesvol aangepast."
      else
        format.html  { render :action => "edit" }
      end       
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html {redirect_to user_url}
    end
  end
end
