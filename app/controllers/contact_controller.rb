class ContactController < ApplicationController
skip_authorization_check
  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => "Bericht is succesvol verstuurd")
    else
      flash.now.alert = "Graag alle velden invullen"
      render :new
    end
  end

end