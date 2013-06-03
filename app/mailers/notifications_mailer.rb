class NotificationsMailer < ActionMailer::Base

  default :from => "noreply.greendrive@gmail.com"
  default :to => "noreply.greendrive@gmail.com"

  def send_message(message)
    @message = message
    mail(:subject => "[localhost:3000] #{message.subject}")
  end

end