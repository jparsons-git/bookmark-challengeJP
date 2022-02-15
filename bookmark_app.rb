# in bookmark.rb
require 'sinatra/base'
require 'sinatra/reloader'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/list' do
    @bookmarks = Bookmark.all
    # bookmarks.join. # I believe this will let the rspecs pass without sending it to the screen
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
