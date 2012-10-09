class FacebookController < ActionController::Base
  layout 'application'

  def create
    user = User.create_facebook_user_from_omniauth(env["omniauth.auth"])
    session[:facebook_user_id] = user.id

    redirect_to facebook_url
  end

  def index

    if session[:facebook_user_id].nil?
      redirect_to 'http://carlos21.com/auth/facebook'
      return
    end

    user = User.find(session[:facebook_user_id])
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

end