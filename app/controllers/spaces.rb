class MakersBnB < Sinatra::Base

  get '/hosts' do
    erb :'spaces/list_space'
  end

  post '/submit-listing' do
    @space = Space.create(title: params[:title],
                        img: params[:image],
                        description: params[:description],
                        price: params[:price],
                        date_from: params[:date_from],
                        date_to: params[:date_to],
                        user_id: current_user.id)

    redirect '/confirmation'
  end

  get '/confirmation' do
    erb :confirmation
  end

  get '/spaces' do
    @spaces = Space.all
    erb :'spaces/spaces'
  end

  get '/spaces/:id' do
    @space = Space.first(id: params[:id])
    session[:space_id] = @space.id
    erb :'spaces/space'
  end

end
