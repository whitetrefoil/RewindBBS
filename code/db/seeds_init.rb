# encoding: utf-8

Role.create(:id => 1, :name => "开发人员")
Role.create(:id => 2, :name => "测试人员")
Role.create(:id => 100, :name => "服务器")
Role.create(:id => 101, :name => "高级管理员")
Role.create(:id => 102, :name => "管理员")
Role.create(:id => 1000, :name => "新用户")
Role.create(:id => 1001, :name => "老用户")
Role.create(:id => 1002, :name => "高级用户")

User.create(:id => 1, :password => "gameboy", :name => "开发人员", :email => "dev@only.me", :role => Role.get(1))
User.create(:id => 2, :password => "gameboy", :name => "靜水詩月", :email => "fir@whitetrefoil.com", :role => Role.get(101))
User.create(:id => 3, :password => "", :name => "芙兰", :email => "whitetrefoil@gmail.com", :role => Role.get(102))
User.create(:id => 4, :password => "", :name => "李月泠", :email => "ulay@whitetrefoil.com", :role => Role.get(1001))
User.create(:id => 5, :password => "", :name => "草野凉子", :email => "ryoko@whitetrefoil.com", :role => Role.get(1002))
User.create(:id => 6, :password => "", :name => "Kristell", :email => "kris@whitetrefoil.com", :role => Role.get(1001))
User.create(:id => 7, :password => "", :name => "李汐华", :email => "shioka@whitetrefoil.com", :role => Role.get(1002))
User.create(:id => 8, :password => "", :name => "Visdialla", :email => "vidia@whitetrefoil.com", :role => Role.get(100))
User.create(:id => 9, :password => "", :name => "Y.U.K.I.", :email => "yuki@whitetrefoil.com", :role => Role.get(1001))
User.create(:id => 10, :password => "", :name => "李丽绮", :email => "riclia@whitetrefoil.com", :role => Role.get(1002))

Systag.create(:id => 1, :name => "紧急", :level => :high)
Systag.create(:id => 2, :name => "公告", :level => :medium)
Systag.create(:id => 3, :name => "置顶", :level => :low)

Usertag.first_or_create(:id => 1, :name => "电脑")
Usertag.first_or_create(:id => 2, :name => "设计")
Usertag.first_or_create(:id => 3, :name => "编程")
Usertag.first_or_create(:id => 4, :name => "ACG")
Usertag.first_or_create(:id => 5, :name => "闲聊")
Usertag.first_or_create(:id => 6, :name => "游戏")
Usertag.first_or_create(:id => 7, :name => "Gal")
Usertag.first_or_create(:id => 8, :name => "COSPLAY")
Usertag.first_or_create(:id => 9, :name => "模型")
Usertag.first_or_create(:id => 10, :name => "手机")
Usertag.first_or_create(:id => 11, :name => "军事")
Usertag.first_or_create(:id => 12, :name => "枪械")
Usertag.first_or_create(:id => 13, :name => "艺术")
Usertag.first_or_create(:id => 14, :name => "绘画")
Usertag.first_or_create(:id => 15, :name => "音乐")
Usertag.first_or_create(:id => 16, :name => "求助")
Usertag.first_or_create(:id => 17, :name => "美食")
Usertag.first_or_create(:id => 18, :name => "旅游")
Usertag.first_or_create(:id => 19, :name => "城市")
Usertag.first_or_create(:id => 20, :name => "摄影")

Post.create(:id => 1, :subject => "本站仍然处于开发阶段", :content => "请大家多多贡献BUG", :user => User.get(8), :systags => [Systag.get(2)], :usertags => [Usertag.get(1), Usertag.get(3)])
Post.create(:id => 2, :subject => "Test", :content => "测试帖子", :user => User.get(2), :systags => [Systag.get(2)], :usertags => [Usertag.get(1), Usertag.get(3)])
Post.create(:id => 3, :subject => "UI设计要拖稿了_(:3 」∠)_", :content => "最近实在是太忙了，要不让月泠来弄吧？", :user => User.get(6), :usertags => [Usertag.get(1), Usertag.get(2)])
Post.create(:id => 4, :subject => "谁来告诉我怎么发粗体字？", :content => "[b]之前不是用这个么？好像没反应，改了？[/b]", :user => User.get(5), :usertags => [Usertag.get(1), Usertag.get(16)])
Post.create(:id => 5, :subject => "请注意！东西不是永久保存的！", :content => "每次服务器重启所有内容都会被重置的，请小心别把重要的东西放上来！", :user => User.get(3), :usertags => [Usertag.get(1), Usertag.get(2)], :systags => [Systag.get(1)])
Post.create(:id => 6, :subject => "数据量不太够，请大家踊跃发帖", :content => "RT", :user => User.get(2), :systags => [Systag.get(2)], :usertags => [Usertag.get(1), Usertag.get(3)])
Post.create(:id => 7, :subject => "[究级问题]今晚吃啥好？", :content => "发愁啊", :user => User.get(9), :usertags => [Usertag.get(16), Usertag.get(17)])
Post.create(:id => 8, :subject => "昨晚辛苦下了6个小时的游戏非法操作啊！！！", :content => "T^T", :user => User.get(2), :usertags => [Usertag.get(1), Usertag.get(4), Usertag.get(6), Usertag.get(11), Usertag.get(12), Usertag.get(5), Usertag.get(16)])
Post.create(:id => 9, :subject => "谁认识人能欧洲代购蔡司的", :content => "这边总觉得有点坑，北美也可以", :user => User.get(10), :usertags => [Usertag.get(20), Usertag.get(16)])
Post.create(:id => 10, :subject => "帮凑数", :content => "RT", :user => User.get(4), :usertags => [Usertag.get(1), Usertag.get(3)])

Comment.create(:content => "**尽力！**", :post_id => 1, :user_id => 2)
Comment.create(:content => "月泠再帮忙弄点回复吧，弄30条", :post_id => 10, :user_id => 10)
30.times do
  Comment.create(:content => "凑数", :post_id => 10, :user_id => 4)
end
Comment.create(:content => %{
|-----------------+------------+-----------------+----------------|
| Default aligned |Left aligned| Center aligned  | Right aligned  |
|-----------------|:-----------|:---------------:|---------------:|
| First body part |Second cell | Third cell      | fourth cell    |
| Second line     |foo         | **strong**      | baz            |
| Third line      |quux        | baz             | bar            |
|-----------------+------------+-----------------+----------------|
| Second body     |            |                 |                |
| 2 line          |            |                 |                |
|=================+============+=================+================|
| Footer row      |            |                 |                |
|-----------------+------------+-----------------+----------------|
}, :post_id => 2, :user_id => 2)
Comment.create(:content => %{
```ruby
def asdf(arg)
  # something
end
}, :post_id => 2, :user_id => 2)
