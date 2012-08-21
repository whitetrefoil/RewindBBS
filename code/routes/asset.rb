# encoding: utf-8

class RewindBBS < Sinatra::Base
  # These routes should **NOT** be touched in prod env.
  get "/css/:name.css" do
    sass :"#{params[:name]}", :views => "public/css/sass"
  end

  get "/js/:name.js" do
    coffee :"#{params[:name]}", :views => "public/js/coffee"
  end
end
