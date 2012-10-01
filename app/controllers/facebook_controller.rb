class FacebookController < ActionController::Base
  layout 'application'
  helper_method :current_user

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id

    redirect_to facebook_url
  end

  def index
    user = User.find(session[:user_id])
    api = Koala::Facebook::API.new(user.oauth_token)
    
    # get profile
    @profile = api.fql_query("select uid, username, first_name, middle_name, last_name, birthday_date, sex, activities, interests, music, movies, books, about_me from user where uid = #{user.uid}").to_json

    # get friends of the current user
    @friends = api.fql_query("select uid, name, contact_email, profile_url, pic_small from user where uid in (select uid2 from friend where uid1 = #{user.uid})").to_json

    # get albums of the current user
    #@albums = api.fql_query("select object_id, src_small from photo where aid in (select aid from album where owner = #{user.uid})").to_json
    #@albums = api.fql_query("select name, description from album where owner = #{user.uid}").to_json
    #@albums = api.get_object("/#{user.uid}/photos")
    @albums = api.get_object("/#{user.uid}/albums")
    #render text: @albums
  end

  def login
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    #render text: 'pajeate mierda'
    #respond_to do |format|
    #  format.json do
    #    render :json => user.to_json
    #  end
    #end
  end

  def failure
    message_key = env['omniauth.error.type']
    render text: message_key
  end

  def logout
    session[:user_id] = nil
    redirect_to root_url
  end

  def friends
    respond_to do |format|
      format.html
    end
  end

  def friends2
    respond_to do |format|
      format.html
    end
  end

  def serverside
     respond_to do |format|
      format.html
    end
  end

  def serversidesuccess
    render text: 'la hiciste mierda'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def koala_login
    
  end

  def koala
    auth = env["omniauth.auth"]
    
    api = Koala::Facebook::API.new(auth.credentials.token)
    graph_data = api.get_object("/#{auth.uid}/friends")

    render json: graph_data
  end

end