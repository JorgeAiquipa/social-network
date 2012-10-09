class User < ActiveRecord::Base
  attr_accessible :name, :oauth_expires_at, :oauth_token, :oauth_secret, :provider, :uid, :username

  def self.create_facebook_user_from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.save!
    end
  end

  def self.create_twitter_user_from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end
  end

  def self.create_github_user_from_omniauth(auth)
    provider = auth[:provider].to_s
    uid = auth[:uid].to_s

    where(provider: provider, uid: uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.username = auth.info.nickname
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_secret = auth.credentials.secret
      user.save!
    end

  end

  def self.get_or_create_google_user(uid, token)
    where(provider: 'google', uid: uid.to_s).first_or_initialize.tap do |user|
      user.provider = 'google'
      user.uid = uid
      user.oauth_token = token
      user.save!
    end

  end

end
