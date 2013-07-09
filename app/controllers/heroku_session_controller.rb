class HerokuSessionController < ApplicationController

  skip_before_filter :sync_heroku_session
  skip_before_filter :check_xhr

  def new
    session[:back_to] = params[:back_to] || request.referrer
    redirect_to '/auth/heroku'
  end

  def create
    oauth_token = request.env["omniauth.auth"]['credentials']['token']
    heroku_session.create(oauth_token)
    redirect_to session.delete(:back_to) || '/'
  end

  def destroy
    heroku_session.destroy
    redirect_to request.referrer
  end

end