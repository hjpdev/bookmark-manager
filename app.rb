require 'sinatra/base'

class Bookmarks < Sinatra::Base


  get '/bookmarks' do


    @bookmarks = [
    'google.com',
    'google.co.uk',
    'google.co'
  ]

    erb :'bookmarks/index'


  end

  run! if app_file == $0
end
