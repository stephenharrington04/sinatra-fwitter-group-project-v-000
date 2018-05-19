class TweetController < ApplicationController

  get '/tweets' do
    redirect "/login" if session[:user_id] == nil
    @user = User.find(session[:user_id])
    erb :'/tweets/tweets'
  end

  get '/tweets/new' do
    redirect "/login" if session[:user_id] == nil
    @user = User.find(session[:user_id])
    erb :'/tweets/create_tweet'
  end

  post '/tweets' do
    redirect :"/tweets/new" if params["content"] == ""
    @tweet = Tweet.create(content: params["content"], user_id: session[:user_id])
    redirect :"/tweets"
  end

  get '/tweets/:id' do
    redirect "/login" if session[:user_id] == nil
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/show_tweet'
  end

  get '/tweets/:id/edit' do
    redirect "/login" if session[:user_id] == nil
    @tweet = Tweet.find(params[:id])
    erb :'/tweets/edit_tweet'
  end

  patch '/tweets/:id' do
    redirect :"/tweets/#{params[:id]}/edit" if params["content"] == ""
    @tweet = Tweet.find(params[:id])
    @tweet.update(content: params[:content])
    @tweet.save
    redirect "/tweets"
  end

  delete '/tweets/:id/delete' do
    redirect "/login" if session[:user_id] == nil
    @tweet = Tweet.find(params[:id])
    redirect "/tweets" if session[:user_id] != @tweet.user_id
    @tweet.delete
    redirect "/tweets"
  end

end
