# Load the rails application
require File.expand_path('../application', __FILE__)

ENV['FACEBOOK_APP_ID'] = '446804795358920'
ENV['FACEBOOK_APP_SECRET'] = '8d7a42db949fd6ddd12bbdb8ebc0ce2c'

ENV['CONSUMER_KEY'] = 'X8SRwkGhwuBC2Zec3YOYcA'
ENV['CONSUMER_SECRET'] = 'g1NcjQHutLpQ0DHvCbXN5MPkeCkvMRAtzU2bvBUB77s'

ENV['GITHUB_ID'] = '3755d7492fba2d75e372'
ENV['GITHUB_SECRET'] = 'e763bfcb2f63eed57cefd1725d36d53d47ccea7a'

ENV['CLIENT_ID'] = '296124660908.apps.googleusercontent.com'
ENV['CLIENT_SECRET'] = 'M8IkiHI6GpQb7MzrZ1cQxQn9'

# Initialize the rails application
Socialnetworks::Application.initialize!
