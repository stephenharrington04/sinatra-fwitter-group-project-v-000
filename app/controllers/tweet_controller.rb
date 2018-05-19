class TweetController < ApplicationController

  get '/tweets' do
    redirect "/users/login" if session[:user_id] == nil
    @user = User.find_by_id(session[:user_id])
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do
    redirect "/users/login" if session[:user_id] == nil
    erb :'/tweets/create_tweet'
  end

  post '/tweets' do
    
  end

end
