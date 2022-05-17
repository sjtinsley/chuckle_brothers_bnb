require 'sinatra/base'
require_relative './lib/space'

class ChuckleHotel < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    # This needs to be changed once we have an 'all' method to avoid global variable
    Space.create(name: params[:name], description: params[:description], price: params[:price]) 
    redirect '/spaces/confirmation'
  end

  get '/spaces/confirmation' do
    @space = Space.all.last
    erb :'spaces/confirmation'
  end

  run! if app_file == $0
end