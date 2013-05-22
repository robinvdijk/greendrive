class UserMailer < ActionMailer::Base
  
  default from: "jeroenstevens0@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @user = user
    mail(:to => user.email, :subject => "Password Reset")
  end

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/sessions/new"
    mail(:to => user.email, :subject => "Welkom bij Greendrivers!")
  end
end
