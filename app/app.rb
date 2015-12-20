require 'sinatra/base'
require_relative 'models/data_mapper_setup'

ENV['RACK_ENV'] ||= 'development'

class BookmarkManager < Sinatra::Base

  enable :sessions

  get '/' do
    @message = session.delete(:message)
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new'
  end

  post '/links' do
    link = Link.new(title: params[:Title], url: params[:url])
    tag = Tag.create(name: params[:tags])
    link.tags << tag
    link.save
    session[:message] = 'Link successfully added'
    redirect '/'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
