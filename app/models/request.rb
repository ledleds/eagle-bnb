require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-timestamps'

class Request

  include DataMapper::Resource

  property :id, Serial
  property :request_date_from, Date
  property :request_date_to, Date

  belongs_to :user
  belongs_to :space

end
