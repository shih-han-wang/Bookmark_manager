require 'sinatra'
require './lib/bookmark.rb'

class Bookmark_Manager < Sinatra::Base

  get '/bookmarks' do
    @bookmark = Bookmark.all
    erb :index
  end

  run! if app_file == $0
end
