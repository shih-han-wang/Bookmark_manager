require 'sinatra'
require './lib/bookmark.rb'
require 'sinatra/flash'

class Bookmark_Manager < Sinatra::Base

  register Sinatra::Flash
  enable :sessions

  post '/bookmarks' do
    flash[:notice] = 'You must submit a valid URL' unless Bookmark.create(url: params[:url])
    redirect to ('/bookmarks')
  end

  get '/bookmarks' do
   "#{flash[:notice]}" if flash[:notice]
   @bookmark = Bookmark.all
   erb :index
 end

  get '/bookmarks/new' do
    erb :new_bookmark
  end

  run! if app_file == $0
end
