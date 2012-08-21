# encoding: utf-8

class RewindModel

  # Start from 1st page, not 0
  def self.page page_num = 1, each_page = 10
    all[each_page * (page_num - 1) ... each_page * page_num]
  end

  def self.pages_count each_page = 10
    (Float(all.length) / each_page).ceil
  end

  def created_before
    if created_at
      self.time_before created_at
    elsif created_on
      self.day_before created_on
    else
      nil
    end
  end

  def update_before
    if updated_at
      self.time_before updated_at
    elsif updated_on
      self.day_before updated_on
    else
      nil
    end
  end


  protected

  def time_before time
    gap = DateTime.now - time
    if gap >= 7
      time.srtftime("%Y年%m月%d日")
    elsif gap >= 1
      "#{gap.to_i} 天前"
    elsif gap * 24 >= 1
      "#{(gap * 24).to_i} 小时前"
    elsif gap * 24 * 60 >= 1
      "#{(gap * 24 * 60).to_i} 分钟前"
    else
      "#{(gap * 24 * 60 * 60).to_i} 秒前"
    end
  end

  def day_before date
    gap = Date.now - date
    if gap >= 30
      time.srtftime("%Y年%m月%d日")
    elsif gap >= 1
      "#{gap.to_i} 天前"
    else
      "24 小时内"
    end
  end

end


require_relative "user"
require_relative "cookie"
require_relative "avatar"
require_relative "sign"
require_relative "role"
require_relative "post"
require_relative "comment"
require_relative "systag"
require_relative "usertag"

DataMapper.finalize
DataMapper.auto_migrate!
