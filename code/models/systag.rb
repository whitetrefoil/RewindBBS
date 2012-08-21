# encoding: utf-8

class Systag < RewindModel
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true, :unique => true, :messages => {
    :presence => :presence,
    :is_unique => :is_unique
  }
  property :level, Enum[:high, :medium, :low], :required => true

  has n, :posts, :through => Resource
end