require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :name, String
  property :email, String, required: true, unique: true
  property :password, Text
  property :password_confirmation, Text

  attr_reader :password
  attr_accessor :password_confirmation
  # validates_confirmation_of :password # FOR BYCRYPT
end

DataMapper.setup(:default, "postgres://localhost/makersbnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
