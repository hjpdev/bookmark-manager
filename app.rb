require 'sinatra/base'
require_relative './lib/bookmark.rb'

class Bookmarks < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmarks/index'
  end

  run! if app_file == $0
end
