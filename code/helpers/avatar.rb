# encoding: utf-8

# `size` only be used when gets avatar from Gravatar.
def get_avatar(user, size = 60)
  if user.is_a?(Fixnum)
    id = user
    email = User.get(user).email
  elsif user.is_a?(String)
    id = User.first(:name => user).id
    email = User.first(:name => user).email
  else
    id = user.id
    email = user.email
  end
  if get_avatar_from_local(id)
    get_avatar_from_local(id)[:url]
  else
    get_avatar_from_gravatar(email, size) or get_default_avatar
  end
end

=begin : This way is toooooooo slow...
def get_avatar_from_gravatar(email, size)
  begin
    hash = Digest::MD5.hexdigest(email.downcase)
    url_prefix = request.scheme == "https" ? "https://secure.gravatar.com/" : "http://www.gravatar.com/"

    json_url = "#{url_prefix}#{hash}.json"
    json_str = open(json_url).read
    user_data = JSON.load(json_str)

    if user_data
      "#{url_prefix}avatar/#{hash}" + (size ? "?s=#{size}" : "")
    else
      nil
    end
  rescue
    nil
  end
end

def get_default_avatar
  "about:blank"
end
=end

def get_avatar_from_local(id)
  if File.exist?("data/avatar/#{id}.png")
    { :url => abs_url("/avatar/#{id}"), :path => "data/avatar/#{id}.png"}
  elsif File.exist?("data/avatar/#{id}.jpg")
    { :url => abs_url("/avatar/#{id}"), :path => "data/avatar/#{id}.jpg"}
  elsif File.exist?("data/avatar/#{id}.jpeg")
    { :url => abs_url("/avatar/#{id}"), :path => "data/avatar/#{id}.jpeg"}
  elsif File.exist?("data/avatar/#{id}.gif")
    { :url => abs_url("/avatar/#{id}"), :path => "data/avatar/#{id}.gif"}
  elsif File.exist?("data/avatar/#{id}.bmp")
    { :url => abs_url("/avatar/#{id}"), :path => "data/avatar/#{id}.bmp"}
  else
    nil
  end
end

def get_avatar_from_gravatar(email, size)
  hash = Digest::MD5.hexdigest(email.downcase)
  url_prefix = request.scheme == "https" ? "https://secure.gravatar.com/" : "http://en.gravatar.com/"
  "#{url_prefix}avatar/#{hash}" + "?d=#{get_default_avatar}" + (size ? "&s=#{size}" : "")
end

def get_default_avatar
  url "/avatar/0"
end
