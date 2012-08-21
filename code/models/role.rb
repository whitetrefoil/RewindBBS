# encoding: utf-8

class Role < RewindModel
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true, :unique => true, :messages => {
    :presence => :presence,
    :is_unique => :is_unique
  }

  has n, :users
end