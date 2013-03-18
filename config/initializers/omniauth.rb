OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['147143375453147'], ENV['34466616f66ecb6c220a3156dbde674b']
end

