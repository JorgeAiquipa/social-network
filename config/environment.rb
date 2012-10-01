# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['FACEBOOK_APP_ID'] = '446804795358920'
ENV['FACEBOOK_APP_SECRET'] = '8d7a42db949fd6ddd12bbdb8ebc0ce2c'

ENV['CONSUMER_KEY'] = '446804795358920'
ENV['CONSUMER_SECRET'] = '8d7a42db949fd6ddd12bbdb8ebc0ce2c'

ENV['CLIENT_ID'] = '446804795358920'
ENV['CLIENT_SECRET'] = '8d7a42db949fd6ddd12bbdb8ebc0ce2c'

# Initialize the rails application
Socialnetworks::Application.initialize!
