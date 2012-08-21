# encoding: utf-8

class Usertag < RewindModel
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true, :unique => true, :messages => {
    :presence => :presence,
    :is_unique => :is_unique
  }
  property :created_at, DateTime

  has n, :posts, :through => Resource
  has n, :users, :through => Resource
end