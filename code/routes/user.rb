# encoding: utf-8

class RewindBBS < Sinatra::Base
  get "/signup" do
    agreements = ""
    begin
      File.open("config/agreements.mkd", 'r:UTF-8') do |f|
        agreements = markdown f.read
      end
    rescue
      agreements = "<strong>找不到用户协议文件……</strong>"
    end

    slim :"user/new", :layout => :layout_single, :locals => { :agreements => agreements }
  end

  post "/user/new" do
    user = User.new( :name => params[:username], :password => params[:password], :email => params[:email], :role => Role.get(3) )
    if user.save
      redirect to("/login")
    else
      error_str = "?error=1"
      ["email", "name"].each do |field|
        error_str << "&#{field}=1" if user.errors[field.to_sym][0] == :presence
        error_str << "&#{field}=2" if user.errors[field.to_sym][0] == :is_unique
        error_str << "&#{field}=3" if user.errors[field.to_sym][0] == :format
      end
      error_str
      #if user.errors[:email]
      #redirect to("/signup?error=1&#{user.errors ? 'email=1' : ''}")
    end
  end

  get "/login" do
    if params[:code] == "5"
      @message = "验证失败……"
    elsif params[:code] == "4"
      @message = "查无此人 - -|||"
    else
      @message = nil
    end
    slim :"user/login", :layout => :layout_single
  end

  post "/login" do
    if user = User.first(:name => params[:username]) or User.first(:name => params[:email])
      if user.authenticate(params[:password])
        session[:user_id] = User.first(:name => params[:username]).id
        redirect to("/")
      else
        redirect to("/login?code=5")
      end
    else
      redirect to("/login?code=4")
    end
  end

  get "/logoff" do
    session[:user_id] = nil
    redirect back
  end
end