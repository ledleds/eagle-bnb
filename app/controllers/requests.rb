# require './app'
class MakersBnB < Sinatra::Base

  post '/submit-request' do
    if within_date_range?(params[:request_date_from], params[:request_date_to])
      request = Request.create(request_date_from: params[:request_date_from],
                          request_date_to: params[:request_date_to],
                          user_id: current_user.id,
                          space_id: current_space.id)
      redirect '/request_sent'
    else
      flash.now[:errors] = ['The property is not available for your chosen dates.']
      erb :'requests/request'
    end

  end

  get '/request_sent' do
      erb :'requests/request_sent'
  end

  get '/request' do
    erb :'requests/request'
  end
end
