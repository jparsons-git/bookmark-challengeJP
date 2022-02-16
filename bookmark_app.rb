# in bookmark.rb
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  # configure :test do
  #   register Sinatra::Reloader
  # end

  get '/' do
    $user_choice = ""
    @user_choice = $user_choice
    $bookmarks = Bookmark.all
    @bookmarks = $bookmarks
    erb :'bookmarks/index'
  end

  post '/choice' do
    @bookmarks = $bookmarks
    $user_choice = params[:choice]
    @user_choice = $user_choice
    redirect '/do_choice'
  end  

  get '/do_choice' do
    @bookmarks = $bookmarks
    @user_choice = $user_choice
    erb :'bookmarks/index'
  end  

  post '/add' do
    @user_choice = $user_choice
    @url = params[:url]
    @title = params[:title]
    Bookmark.add_bookmark(@url, @title)
    $user_choice = ""
    @user_choice = $user_choice
    $bookmarks = Bookmark.all
    @bookmarks = $bookmarks
    erb :'bookmarks/index'
    #redirect '/'
  end  

  run! if app_file == $0
end
