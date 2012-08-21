# encoding: utf-8

class RewindBBS < Sinatra::Base

  # This route only be used in dev env without nginx.
  get "/avatar/:id" do
    send_file get_avatar_from_local(params[:id])[:path]
  end
end