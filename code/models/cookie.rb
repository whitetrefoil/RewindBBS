# encoding: utf-8

class Cookie < RewindModel
  include DataMapper::Resource

  # user_id
  property :cookie_key, String, :length => 128, :required => true, :unique => true, :messages => {
    :presence => :presence,
    :is_unique => :is_unique
  }
  property :updated_at, DateTime

  belongs_to :user, :key => true
end