class ContactController < ApplicationController
skip_authorization_check
  
  def new_message
    @message = Message.new
  end
  
  def new
    new_message
  end

  def create
    new_message(params[:message])
    
    if @message.valid?
      NotificationsMailer.send_message(@message).deliver
      redirect_to(root_path, :notice => "Bericht is succesvol verstuurd")
    else
      flash.now.alert = "Graag alle velden invullen"
      render :new
    end
  end

end