require 'sinatra/base'
require 'uri'
require 'sinatra/flash'
require_relative './lib/bookmark.rb'

class Bookmarks < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  post '/bookmarks' do
    flash[:notice] = 'Invalid URL' unless Bookmark.create(url: params['url'])
    redirect('/bookmarks')
  end

  get '/bookmarks/new' do
    erb(:'bookmarks/new')
  end

  run! if app_file == $0
end
