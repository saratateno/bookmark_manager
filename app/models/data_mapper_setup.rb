require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'tag'
require_relative 'link'
require_relative 'user'

database_name = "postgres://localhost/bookmark_manager_#{ENV["RACK_ENV"]}"
DataMapper.setup(:default, ENV['DATABASE_URL'] || database_name)
DataMapper.finalize
