require 'httparty'
require 'google/api_client'

class GoogleController < ActionController::Base
  include HTTParty

  layout 'application'
  before_filter :validate

  def validate
    @client = Google::APIClient.new
    @client.authorization.client_id = '296124660908.apps.googleusercontent.com'
    @client.authorization.client_secret = 'M8IkiHI6GpQb7MzrZ1cQxQn9'
    @client.authorization.scope = 'https://www.googleapis.com/auth/userinfo.profile+https://www.googleapis.com/auth/userinfo.email'
    @client.authorization.redirect_uri = 'http://socialnetworks.carlos21.com/oauth2callback'
    @client.authorization.code = params[:code] if params[:code]

    if session[:google_user_id]
      user = User.find(session[:google_user_id])
      #@client.authorization.update_token!(user.oauth_token)
    end

    if @client.authorization.refresh_token && @client.authorization.expired?
      @client.authorization.fetch_access_token!
    end
    
    #unless @client.authorization.access_token || request.path_info =~ /^\/oauth2/
      #logger.debug 'ESTA REDIRECCIONANDO'
      #redirect_to 'http://localhost:9000/oauth2authorize'
    #end
    
  end

  def oauth2authorize
    redirect_to @client.authorization.authorization_uri.to_s
  end

  def oauth2callback
    @client.authorization.fetch_access_token!
    session[:google_token] = @client.authorization.access_token
    redirect_to google_url
  end

  def index

    # get a user by userid
    @profile = HTTParty.get("https://www.googleapis.com/oauth2/v1/userinfo?access_token=#{session[:google_token]}").to_json

    # create  a user or get a user by authorization id
    user = User.get_or_create_google_user(@profile['id'], session[:google_token])
    session[:google_user_id] = user.id
    
    #render text: @profile
  end

  def show_map
    render 'google/googlemaps'
  end

end