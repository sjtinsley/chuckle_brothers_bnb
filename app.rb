require 'sinatra/base'

class ChuckleHotel < Sinatra::Base

  get '/' do
    'Hello World'
  end

  get '/spaces/new' do
    erb :'spaces/new'
  end

  post '/spaces' do
    $space = Space.create(name: params[:name], description: params[:description], price: params[:price])
    redirect '/spaces/confirmation'
  end



  run! if app_file == $0
end