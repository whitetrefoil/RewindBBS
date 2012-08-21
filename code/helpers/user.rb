# encoding: utf-8

def user_url(user)
  abs_url "/user/#{user.is_a?(Fixnum) ? user : user.id}"
end
