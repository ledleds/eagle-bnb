class MakersBnB < Sinatra::Base

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
      redirect '/'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/sign_up'
    end
  end

  get '/users/:username' do
    user = User.first(username: params[:username])
    @listings = user.spaces
    @requests = user.requests
    erb :'users/account'
  end

  post '/approve' do
    p params[:name]
    @request_to_be_approved = params[:name]
    @request_to_be_approved.approved = true

  end


end
