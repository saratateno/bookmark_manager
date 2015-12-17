ENV['RACK_ENV'] ||= 'development'

require 'sinatra/base'
require_relative 'models/data_mapper_setup'

class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links'
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

  # start the server if ruby file executed directly
  run! if app_file == $0
end
