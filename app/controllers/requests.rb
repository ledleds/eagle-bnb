class MakersBnB < Sinatra::Base



  post '/submit-request' do
    request = Request.create(request_date_from: params[:request_date_from],
                        request_date_to: params[:request_date_to],
                        user_id: current_user.id,
                        space_id: current_space.id)
    redirect '/request_sent'
  end

  get '/request_sent' do
      erb :'requests/request_sent'
  end

  get '/request' do
    erb :'requests/request'
  end

end
