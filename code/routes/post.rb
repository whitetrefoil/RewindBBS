# encoding: utf-8

class RewindBBS < Sinatra::Base
  post "/post/:id/comment/new" do
    newCom = Comment.create(:user_id => session[:user_id], :post_id => params[:id], :content => params[:newCommentContent])
    redirect to("/post/#{params[:id]}")
  end

  get "/post/new" do
    @systags = Systag.all
    slim :"/post/new"
  end

  post "/post/new" do
    save_post(:user_id => session[:user_id], :subject => params[:subject], :content => params[:content], :tagstr => params[:tags])
  end

  get "/post/:id" do
    @post = Post.get(params[:id])

    slim :"/post/get"
  end

end
