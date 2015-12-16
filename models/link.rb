require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'


class Link
  include DataMapper::Resource

  property :id, Serial
  property :url, String
  property :title, String
end

database_name = "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database_name)
DataMapper.finalize.auto_upgrade!
