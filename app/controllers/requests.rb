class MakersBnB < Sinatra::Base



  post '/submit-request' do
    request = Request.create(request_date_from: params[:request_date_from],
                        request_date_to: params[:request_date_to],
                        username: current_user.username,
                        user_id: current_user.id,
                        space_id: current_space.id)
    redirect '/request'
  end

  get '/request' do
    erb :'request'
  end

end
