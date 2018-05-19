require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def go_log_in
      redirect "/login" if !logged_in?
    end

    def current_user
      User.find(session[:user_id])
    end

    def current_tweet
      Tweet.find(params[:id])
    end
  end

end
