# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Greendrive::Application.initialize!

config.action_mailer.delivery_method = :smtp

config.action_mailer.default_url_options = { :host => "http://rocky-woodland-7345.herokuapp.com" }