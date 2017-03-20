require 'sinatra/base'
require_relative 'models/user'

class MakersBnB < Sinatra::Base

  get '/' do
    erb :'users/index'
  end

  get '/users/new' do
    erb :'users/sign_up'
  end

  post '/users' do
    @user = User.create(username: params[:username],
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    redirect '/users'
  end

  get '/users' do
    'Welcome new user!'
  end

  run! if app_file == $0
end
