OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '152842184878957', '63ffd865b7fceda0e884978acb40a14b'
end
