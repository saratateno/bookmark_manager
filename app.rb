require 'sinatra/base'
require './models/links.rb'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Hello BookmarkManager!'
  end

  get '/links' do

  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
