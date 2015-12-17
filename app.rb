ENV["RACK_ENV"] ||= "development"

require 'sinatra/base'
require_relative 'data_mapper_setup.rb'
require_relative 'models/link.rb'

class BookmarkManager < Sinatra::Base

  get '/' do
    redirect '/links'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'/links/new'
  end


  post '/links' do
    link = Link.new(url: params[:url], title: params[:Name])
    params[:tags].split.each do |tag_name|
      tag  = Tag.first_or_create(name: tag_name)
      link.tags << tag
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'/links/index'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
