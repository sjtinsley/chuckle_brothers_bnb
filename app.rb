require 'sinatra/base'
require_relative './lib/space'
require_relative './lib/user'
require_relative './lib/bookingrequest'
require_relative './lib/database_connection'

class ChuckleHotel < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/spaces' do
    @user = session[:user_id]
    @spaces = Space.all
    erb :spaces
  end
  
  get '/spaces/new' do
    @user = User.find(id: session[:user_id])
    erb :'spaces/new'
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price], user_id: params[:user_id]) 
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
  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], price: params[:price]) 
    redirect '/spaces/confirmation'
  end

  get '/spaces/:id' do 
    @space = Space.find(id: params[:id])
    erb :'spaces/space'
  end 

  post '/booking' do
    booking_request = BookingRequest.create(date: params[:date], space_id: params[:space_id])
    redirect "/booking/#{booking_request.id}/confirmation"
  end

  get '/booking/:id/confirmation' do
    booking_request = BookingRequest.find(id: params[:id])
    @space = Space.find(id: booking_request.space_id)
    erb :'booking/confirmation'
  end
  
  get '/sessions/new' do
    erb :'sessions/new'
  end 

  post 'sessions/new' do 
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
    else
      flash[:notice] = 'Email or password incorrect'
      redirect '/sessions/new'
    end
    redirect '/spaces'
  end 


  run! if app_file == $0
end