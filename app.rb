require 'sinatra/base'
require 'uri'
require 'sinatra/flash'
require_relative './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end  

  post '/bookmarks/new' do
    flash[:notice] = "Invalid URL" unless Bookmark.create(url: params[:url], title: params[:title])
    redirect(:'/bookmarks')
  end

  run! if app_file == $0
end
