require 'sinatra/base'
require_relative 'models/user'
require 'sinatra/flash'

class MakersBnB < Sinatra::Base

register Sinatra::Flash

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
    if @user.save
      session[:user_id] = @user.id
      redirect '/users'
    else
      flash.now[:notice] = "Email must not be blank"
      erb :'users/sign_up'
    end
  end

  get '/users' do
    'Welcome new user!'
  end

  run! if app_file == $0
end
