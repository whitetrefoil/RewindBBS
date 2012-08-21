# encoding: utf-8

class Avatar < RewindModel
  include DataMapper::Resource

  # user_id
  property :path, String, :required => true
  property :width, Integer
  property :height, Integer
  property :updated_at, DateTime

  belongs_to :user, :key => true

end