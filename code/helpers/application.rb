# encoding: utf-8

class String
  def html_safe?
    false
  end
end

class SlimPathString < String
  attr_accessor :html_safe

  def initialize(args)
    @html_safe = true
    super(args)
  end

  def html_safe?
    @html_safe
  end
end

def abs_url url
  output = request.script_name.to_s + url.to_s
  SlimPathString.new output
end

def format_html(content)
  output = EscapeUtils.escape_html(content)
  output = markdown output
  SlimPathString.new(output)
end
