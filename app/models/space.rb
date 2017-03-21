require 'data_mapper'
require 'dm-postgres-adapter'

class Space
  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
  property :date_from, Date
  property :date_to, Date

end

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
