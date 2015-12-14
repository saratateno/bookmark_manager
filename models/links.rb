require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'

DataMapper.setup(:default, "postgres://localhost/bookmark_manager")

# class Link
#   include DataMapper::Resource
#
#   property :id, Serial
#   property :url, String
#   property :title, String
# end

DataMapper.finalize
DataMapper.auto_upgrade!
