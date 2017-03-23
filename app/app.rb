ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require 'sinatra/flash'
require 'date'
require_relative 'models/user'
require_relative 'models/space'
require_relative 'models/request'
require_relative './datamapper_setup'


class MakersBnB < Sinatra::Base

  enable :sessions
  register Sinatra::Flash
  use Rack::MethodOverride

  helpers do
      def current_user
        @current_user ||= User.get(session[:user_id])
      end

      def current_space
        @current_space ||= Space.get(session[:space_id])
      end
  end

  get '/' do
    erb :'users/index'
  end

  run! if app_file == $0
end

require_relative './controllers/requests'
require_relative './controllers/users'
require_relative './controllers/sessions'
require_relative './controllers/spaces'
