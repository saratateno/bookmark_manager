require 'sinatra/base'
require_relative 'models/link'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/links' do
    @message = session.delete(:message)
    @links = Link.all
    erb :'links/index'
  end

  get '/add-link' do
    erb :'links/add-link'
  end

  post '/links' do
    Link.create(title: params[:Title], url: params[:URL])
    session[:message] = 'Link successfully added'
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
