class SessionsController < ActionController::Base

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    
    #@graph = Koala::Facebook::API.new(user.oauth_token)
    #friends = @graph.get_connections("uid", "friends")
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  

  

end