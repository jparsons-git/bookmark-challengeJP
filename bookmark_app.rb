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

  enable :sessions, :method_override

  get '/' do
    $user_choice = ""
    @user_choice = $user_choice
    $bookmarks = Bookmark.all
    @bookmarks = $bookmarks
    erb :'bookmarks/index'
  end

  post '/choice' do
    p 'start of /choice'
    p params
    @bookmarks = $bookmarks
    $user_choice = params[:choice]
    @user_choice = $user_choice
    redirect '/do_choice'
  end  

  get '/do_choice' do
    p 'start of /do choice'
    p params
    @bookmarks = $bookmarks
    @user_choice = $user_choice
    erb :'bookmarks/index'
  end  

  post '/add' do
    p 'start of /add'
    p params
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

  delete '/bookmarks/:id' do
  # delete do  
    p 'start of /delete'
    p params[:id]
    Bookmark.delete(params[:id])
    redirect '/'
  end  

  run! if app_file == $0
end
