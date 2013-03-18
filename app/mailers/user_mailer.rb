class UserMailer < ActionMailer::Base
  default from: "jeroenstevens@live.nl"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset(user)
    @greeting = "Hi"
    @user = user
    mail(:to => user.email, :subject => "Registered")
  end
end
