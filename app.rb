require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/space'
require_relative './lib/user'
require_relative './lib/bookingrequest'
require_relative './lib/database_connection'

class ChuckleHotel < Sinatra::Base
  enable :sessions
  register Sinatra::Flash

  get '/' do
    erb :index
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/index'
  end
  
  get '/spaces/new' do
    if session[:user_id]
      @user = User.find(id: session[:user_id])
      erb :'spaces/new'
    else
      flash[:notice] = 'You must be logged in to create a space'
      redirect '/'
    end
  end

  post '/spaces' do
    Space.create(name: params[:name], description: params[:description], 
      price: params[:price], user_id: params[:user_id], available_from: params[:available_from], 
      available_to: params[:available_to]) 
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
    user = User.create(username: params[:username], email: params[:email], password: params[:password]) 
    session[:user_id] = user.id
    flash[:notice] = 'Thanks for signing up to Chuckle Hotel'
    redirect '/spaces'
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
    if session[:user_id]
      @space = Space.find(id: params[:id])
      @guest_id = session[:user_id]
      erb :'spaces/space'
    else
      flash[:notice] = 'You must be logged in to view a space'
      redirect '/'
    end
  end 

  post '/booking' do
    booking_request = BookingRequest.create(date: params[:date], space_id: params[:space_id], guest_id: session[:user_id])
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

  post '/sessions' do 
    user = User.authenticate(email: params[:email], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect '/spaces'
    else
      flash[:notice] = 'Email or password incorrect'
      redirect '/sessions/new'
    end
  end 

  post '/sessions/destroy' do
    session.clear
    flash[:notice] = 'You have logged out successfully'
    redirect '/'
  end

  get '/host/requests' do
    @booking_requests = BookingRequest.all_for_user(id: session[:user_id])
    erb :'host/requests'
  end
  

  get '/host/spaces' do
    erb :'host/index'
  end

  post '/requests/approve' do
    request = BookingRequest.approve(id: params[:request_option])
    session[:last_request] = params[:request_option]
    redirect '/host/approved'
  end

  post '/requests/reject' do
    request = BookingRequest.reject(id: params[:request_option])
    session[:last_request] = params[:request_option]
    redirect '/host/rejected'
  end

  get '/host/approved' do
    p session[:last_request]
    @space = Space.find(id: BookingRequest.find(id: session[:last_request]).space_id)
    erb :'host/approved'
  end

  get '/host/rejected' do
    @space = Space.find(id: BookingRequest.find(id: session[:last_request]).space_id)
    erb :'host/rejected'
  end

  get '/host' do
    if session[:user_id]
      erb :'host/index'
    else
      flash[:notice] = 'You must be logged in to be a host'
      redirect '/'
    end
  end

  run! if app_file == $0
end