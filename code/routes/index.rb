# encoding: utf-8

class RewindBBS < Sinatra::Base
  before do
    @user = session[:user_id] ? User.get(session[:user_id]) : nil
  end

  # Styles
  get "/css/:filename.css" do
    if File.exist? "css/#{params[:filename]}.sass.slim"
      slim :"css/#{params[:filename]}.sass"
    elsif File.exist? "css/#{params[:filename]}.scss.slim"
      slim :"css/#{params[:filename]}.scss"
    else
      sass :"css/#{params[:filename]}"
    end
  end

  # JavaScripts
  get "/js/:filename.js" do
    if File.exist? "js/#{params[:filename]}.coffee.slim"
      slim :"js/#{params[:filename]}.coffee"
    else
      coffee :"js/#{params[:filename]}"
    end
  end

  # This should be serve by Nginx in production
  get "/" do
    @posts = Post.all.page(1)
    slim :index
  end
end
