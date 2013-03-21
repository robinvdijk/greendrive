

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '147143375453147', '34466616f66ecb6c220a3156dbde674b',{:scope => 'email, publish_stream', :client_options => { :ssl => { :ca_file => "#{Rails.root}/config/ca-bundle.crt" } } }
end

# OmniAuth.config.on_failure = Proc.new do |env|
#   UsersController.action(:omniauth_failure).call(env)
# end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, '	147143375453147', '34466616f66ecb6c220a3156dbde674b'
# end


# Rails.application.config.middleware.use OmniAuth::Builder do

# 	provider :facebook, '147143375453147', '34466616f66ecb6c220a3156dbde674b', {client_options: {ssl: {ca_file: Rails.root.join('lib/assets/cacert.pem').to_s}}}
# 	#Behind the APP_SECRET is a line of code which makes sure you don't get an SSL error [on windows].

# end



# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :facebook, ENV['147143375453147'], ENV['34466616f66ecb6c220a3156dbde674b']
# end

