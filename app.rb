require 'sinatra/base'
require 'sinatra/reloader'
require './lib/space'

class ChuckleHotel < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end

  run! if app_file == $0
end