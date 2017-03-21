require 'data_mapper'
require 'dm-postgres-adapter'

class Space

  include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :description, Text
  property :price, Integer
  property :date_from, String
  property :date_to, String


  attr_reader :title, :description, :price


end
