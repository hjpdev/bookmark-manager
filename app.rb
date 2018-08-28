require 'sinatra/base'

class Bookmarks < Sinatra::Base

  get '/' do
    erb(:index)
  end

  get '/bookmarks' do
    'Hello'
  end

  run! if app_file == $0
end
