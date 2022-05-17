require 'sinatra/base'
require_relative './lib/space'
require_relative './lib/bookingrequest'

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

  get '/spaces/confirmation' do
    @space = Space.all.last
    erb :'spaces/confirmation'
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


  run! if app_file == $0
end