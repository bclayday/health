OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :runkeeper, ENV['runkeeper_id'], ENV['runkeeper_secret']
end