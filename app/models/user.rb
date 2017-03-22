require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :name, String
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :spaces, through: Resource
  # For later: when request database is set up
  # has n, :requests, through: Resource


  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
   @password = password
   self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end

end
