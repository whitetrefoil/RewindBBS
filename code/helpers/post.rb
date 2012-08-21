# encoding: utf-8

# Receive a string of tags collection which splitted by whitespaces.
# Check if thost tags are existed, if not, create as new user-tag.
# Return 2 arrays of models.
def check_tags(tagstr)
  systags = []
  usertags = []
  tagstr.split(' ').each do |tag|
    if Systag.first(:name => tag)
      systags.push Systag.first(:name => tag)
    elsif Usertag.first(:name => tag)
      usertags.push Usertag.first(:name => tag)
    else
      usertags.push Usertag.create(:name => tag)
    end
  end

  [systags, usertags]
end

def save_post(params)
  if params[:user]
    user = params[:user]
  elsif params[:username]
    user = User.first(:username => params[:username])
  elsif params[:user_id]
    user = User.get(params[:user_id])
  else
    user = User.get(session[:user_id])
  end
  subject = params[:subject]
  content = params[:content]
  systags, usertags = check_tags(params[:tagstr])

  Post.create(:user => user, :subject => subject, :content => content, :systags => systags, :usertags => usertags)
end

def post_url(post)
  abs_url "/post/#{post.is_a?(Fixnum) ? post : post.id}"
end
