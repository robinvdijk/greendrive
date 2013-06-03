class PagesController < ApplicationController
  skip_authorization_check :only => [:faq, :homepage, :contact]
end
