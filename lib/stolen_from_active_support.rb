# (basically) shamelessly stolen so we don't have to require ActiveSupport
# These methods all have to do with turning hashes into query params

class Object
  def to_query(key)
    require 'cgi' unless defined?(CGI) && defined?(CGI::escape)
    "#{CGI.escape(key.to_param)}=#{CGI.escape(to_param.to_s)}"
  end

  def to_param
    to_s
  end
end

class Hash
  # File activesupport/lib/active_support/core_ext/hash/conversions.rb, line 91
  def to_param
    collect do |key, value|
      value.to_query(key)
    end.sort * '&'
  end
end
