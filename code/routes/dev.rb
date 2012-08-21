# encoding: utf-8

class RewindBBS < Sinatra::Base
  # This should be serve by Nginx in production
  get "/dev/test/db/user" do
    #User.create({:password => "gameboy", :email => "test@asdf.com", :name => "中文测试"})
    if Role.all.length > 0
      role = Role.first
    else
      role = Role.create(:name => "测试用户")
    end
    new_user = User.create({ :name => "中文测试", :email => "test@asdf.com", :role => role, :password => "gameboy"})
    auth = User.first.authenticate("gameboy")
    wrong_auth = User.first.authenticate("asdfasdfasdf")
    "共有#{User.all.length}个用户，#{auth ? "正确密码验证成功" : "正确密码验证失败"}， #{wrong_auth ? "错误密码验证通过" : "错误密码验证被拒"}"
  end

  get "/dev/test/db/role" do
    Role.create(:name => "测试角色")
    "共有#{Role.all.length}个角色"
  end

  get "/dev/test/path" do
    slim :"dev/path/script_name"
  end
end