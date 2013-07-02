class HerokuSessionController < ApplicationController

  skip_before_filter :check_xhr

  def new
    session[:back_to] = request.referrer
    redirect_to '/auth/heroku'
  end

  def create
    auth_token = request.env["omniauth.auth"]
    user_info = HerokuUserInfo.find_or_create_from_oauth_token(auth_token['credentials']['token'])
    user = user_info.user
    log_on_user(user)
    redirect_to session.delete(:back_to) || '/'
  end

end