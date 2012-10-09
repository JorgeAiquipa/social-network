require 'httparty'
require 'twitter'

class TwitterController < ActionController::Base
  include HTTParty

  layout 'application'

  def create
    user = User.create_twitter_user_from_omniauth(env["omniauth.auth"])
    session[:twitter_user_id] = user.id

    redirect_to twitter_url
    #raise env["omniauth.auth"].to_json

  end

  def index

    if session[:twitter_user_id].nil?
      redirect_to 'http://carlos21.com/auth/twitter'
      return
    end

    user = User.find(session[:twitter_user_id])

    @client = Twitter::Client.new(
      :oauth_token => user.oauth_token,
      :oauth_token_secret => user.oauth_secret
    )

    @profile = @client.user(user.username).to_json
    @tweets = @client.user_timeline(user.username).to_json
    #raise @tweets.to_yaml
  end

end