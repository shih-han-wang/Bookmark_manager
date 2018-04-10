require 'sinatra'
require './lib/bookmark.rb'

class Bookmark_Manager < Sinatra::Base

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    redirect to ('/bookmarks')
  end

  get '/bookmarks' do
   @bookmark = Bookmark.all
   erb :index
 end

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  run! if app_file == $0
end
