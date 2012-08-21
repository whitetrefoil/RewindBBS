# encoding: utf-8

class Post < RewindModel
  include DataMapper::Resource

  property :id, Serial
  # user_id
  property :subject, String, :index => true, :required => true
  property :content, Text, :default => ""
  property :viewed_count, Integer, :default => 0
  property :is_draft, Boolean, :default => false

  timestamps :at

  belongs_to :user
  has n, :comments
  has n, :systags, :through => Resource
  has n, :usertags, :through => Resource
end
