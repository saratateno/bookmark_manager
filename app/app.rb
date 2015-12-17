ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'scrambling'

  helpers do

    def current_user
      @current_user ||= User.get(session[:user_id])
    end

  end

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :links
  end

  get '/links/new' do
    erb :new
  end

  post '/links' do
    link = Link.new(title: params[:title], url: params[:url])
    tag_names = params[:tags].split(', ')
    tag_names.each do |name|
      link.tags << Tag.first_or_create(name: name)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    filter_tag = Tag.first(name: params[:name])
    @links = filter_tag ? filter_tag.links : []
    erb :links
  end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do
    user = User.create( email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation])
    session[:user_id] = user.id
    redirect '/links'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
