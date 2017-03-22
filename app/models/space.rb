require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
  property :date_from, Date
  property :date_to, Date

  # belongs_to :user

end
