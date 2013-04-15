if Rails.env != 'test'
  email_settings = YAML::load(File.open("#{Rails.root.to_s}/config/email.yml"))
  ActionMailer::Base.smtp_settings = email_settings[Rails.env] unless email_settings[Rails.env].nil?
end

ActionMailer::Base.smtp_settings = {  
    :address => "smtp.gmail.com",
    :port => "587",
    :domain => "www.yourdomain.com",
    :authentication => :login,
    :user_name => "noreply.greendrive@gmail.com",
    :password => "green2012"
  }


ActionMailer::Base.default_url_options[:host] = "localhost:3000"  