require 'httparty'

class GithubController < ActionController::Base
  include HTTParty

  layout 'application'

  def create
    user = User.create_github_user_from_omniauth(env["omniauth.auth"])
    session[:github_user_id] = user.id

    redirect_to github_url
  end

  def index

    if session[:github_user_id].nil?
      redirect_to 'http://localhost:9000/auth/github'
      return
    end

    user = User.find(session[:github_user_id])

    @gists = HTTParty.get("https://api.github.com/users/#{user.username}/gists?access_token=#{user.oauth_token}").to_json
    @repositories = HTTParty.get("https://api.github.com/user/repos?access_token=#{user.oauth_token}").to_json
    #raise @repositories.to_yaml
  end

  def delete_gist 
    gist_id = params[:id]
    user = User.find(session[:github_user_id])

    @response = HTTParty.delete("https://api.github.com/gists/#{gist_id}?access_token=#{user.oauth_token}").to_json
    #raise @response.to_yaml
  end

end