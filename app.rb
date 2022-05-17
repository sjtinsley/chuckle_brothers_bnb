require 'sinatra/base'
require_relative './lib/space'
require_relative './lib/user'

class ChuckleHotel < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/spaces' do
    @spaces = Space.all
    erb :spaces
  end
  
  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price]) 
    redirect '/spaces/confirmation'
  end

  get '/spaces/confirmation' do
    @space = Space.all.last
    erb :'spaces/confirmation'
  end

  get '/users/new' do
    erb :'users/new'
  end
  
  post '/users' do
    User.create(username: params[:username], email: params[:email], password: params[:password]) 
    redirect '/users/confirmation'
  end

  get '/users/confirmation' do
    @user = User.all.last
    erb :'users/confirmation'
  end


  run! if app_file == $0
end