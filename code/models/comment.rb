# encoding: utf-8

class Comment < RewindModel
  include DataMapper::Resource

  property :id, Serial
  # user_id
  # post_id
  property :content, Text, :default => ""

  timestamps :at

  belongs_to :user
  belongs_to :post
end