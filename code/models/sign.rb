# encoding: utf-8

class Sign < RewindModel
  include DataMapper::Resource

  # user_id
  property :content, Text, :default => ""

  belongs_to :user, :key => true

end