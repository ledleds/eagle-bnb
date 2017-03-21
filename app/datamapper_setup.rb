require 'data_mapper'
require 'dm-postgres-adapter'

require './app/models/user'

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
