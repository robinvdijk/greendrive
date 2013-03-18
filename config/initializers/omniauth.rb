Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '162459833909745', '1ec648c13a19a2cde4da084c7c8d8776'
end