# encoding: utf-8

require "sinatra/base"
require "sinatra/contrib"
require "sinatra/reloader"
require "sass"
require "slim"
require "markdown"
require "fileutils"
require "yaml"
require "data_mapper"
require "bcrypt"
require "coffee_script"
require "kramdown"
require "escape_utils"
require "digest/md5"
require "open-uri"

class RewindBBS < Sinatra::Base
  register Sinatra::Contrib
  enable :sessions

  config_file "config/site_info.yaml"

  configure :production do
    set :slim, :use_html_safe => true
    set :clean_trace, true
    site_uri = URI.parse(settings.siteinfo["location"])
    set :sessions, { :path => site_uri.path, :domain => site_uri.host }
    require_relative "config/db_production"
  end

  configure :development do
    register Sinatra::Reloader
    set :slim, :pretty => true, :use_html_safe => true
    set :sass, { :style => :expanded, :always_check => true, :always_update => true }
    set :cookie_options, { :path => '/', :domain => nil }
    set :sessions, { :path => '/', :domain => nil }
    require_relative "config/db_development"
  end
end

require_relative "models/init"
require_relative "helpers/init"
require_relative "db/seeds_init"
require_relative "routes/init"
