source 'http://rubygems.org'

gem 'rails'
gem 'thin'
gem 'cancan'

gem 'rails_best_practices'
gem "flot-rails"
gem 'friendly_id'

gem 'susy'
gem 'compass', '>= 0.12.2'
gem 'compass-rails', '>= 1.0.3'
gem 'httparty'
gem 'json'
gem 'capistrano'
gem 'whenever', :require => false

# used for avatar uploading
gem 'carrierwave'
gem 'mini_magick', '~> 3.5.0'

gem 'rails-i18n'

gem "jquery-rails"

gem 'googlecharts', :require => 'gchart'

gem 'gon'

group :development do 
  gem 'sqlite3'
end

group :production do 
  gem 'pg'
end

gem "nifty-generators", :group => :development
gem 'mongrel', '1.2.0.pre2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

#user password encrypter
gem "bcrypt-ruby", :require => "bcrypt"

#multi authentication + facebook authentication
gem 'omniauth', '~> 1.1.1'
gem 'omniauth-facebook', '~> 1.4.0'

# Behaviour driven development framework, describing user behaviour patterns
  gem "rspec-rails"
  
# For faster output of actions (example: starting server or generating controllers) use zeus. Do "gem install zeus", followed by "zeus start". Open new tab/window of your terminal with CMD+T, run "zeus server"(alias: s). Notice the difference! Note: Don't place it in the Gemfile, only available on Mac/Linux.   

# guard is a tool used for automatic handeling of actions (example: bundeling, browser refreshing). To use guard run "guard"  
  gem 'guard-livereload' # http://feedback.livereload.com/knowledgebase/articles/86242-how-do-i-install-and-use-the-browser-extensions-
  gem 'guard-bundler' 

group :test do 
  #User actions simulating
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'launchy' #capybara requirement
  
  gem 'selenium-webdriver'  #Visualizing of tests
  gem 'factory_girl_rails'  #fixtures replacement for orginazing test data
  gem 'rb-fsevent'          #guard requirement
  gem 'guard-rspec'         #automatic testing on the background 
  
  #clears the database of the test environment after each action.
  gem 'database_cleaner'
  
end

