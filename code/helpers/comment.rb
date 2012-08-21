# encoding: utf-8

def new_comment_url(post)
  abs_url("/post/#{post.is_a?(Fixnum) ? post : post.id}/comment/new")
end