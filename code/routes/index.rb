# encoding: utf-8

class RewindBBS < Sinatra::Base
  before do
    @user = session[:user_id] ? User.get(session[:user_id]) : nil
  end

  # This should be serve by Nginx in production
  get "/" do
    @posts = Post.all.page(1)
    slim :index
  end
end
