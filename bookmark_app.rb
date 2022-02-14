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
    #  @bookmarks = ["https://docs.google.com/document/d/19wuJ3oKobED28AehkqsHHqtCI-p-_HCs/edit",
    #                "https://docs.google.com/document/d/1W5xKXbCuYiEpGtpP5oMcEpuTbZ5IZVvNcgD2pdygnm8/edit",
    #                "https://docs.google.com/document/d/13R5HO6XMndu-5PgNoCDsI_fPwEZBEOi6/edit"]
    @bookmarks = Bookmark.all
    # bookmarks.join. # I believe this will let the rspecs pass without sending it to the screen
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
