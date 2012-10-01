OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_APP_SECRET']
  #provider :twitter, ENV['CONSUMER_KEY'], ENV['CONSUMER_SECRET']
  #provider :github, ENV['CLIENT_ID'], ENV['CLIENT_SECRET']
end