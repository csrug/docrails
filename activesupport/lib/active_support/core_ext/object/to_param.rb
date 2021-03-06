class Object
  # Alias of <tt>to_s</tt>.
  def to_param
    to_s
  end
end

class NilClass
  def to_param
    self
  end
end

class TrueClass
  def to_param
    self
  end
end

class FalseClass
  def to_param
    self
  end
end

class Array
  # Calls <tt>to_param</tt> on all its elements and joins the result with
  # slashes. This is used by <tt>url_for</tt> in Action Pack.
  def to_param
    collect { |e| e.to_param }.join '/'
  end
end

class Hash
  # Converts a hash into a string suitable for use as a URL query string. An optional <tt>namespace</tt> can be
  # passed to enclose the param names (see example below). The string pairs "key=value" that conform the query
  # string are sorted lexicographically in ascending order.
  #
  # ==== Examples
  #   { :name => 'David', :nationality => 'Danish' }.to_param # => "name=David&nationality=Danish"
  #
  #   { :name => 'David', :nationality => 'Danish' }.to_query('user') # => "user%5Bname%5D=David&user%5Bnationality%5D=Danish"
  def to_param(namespace = nil)
    collect do |key, value|
      value.to_query(namespace ? "#{namespace}[#{key}]" : key)
    end.sort * '&'
  end
end
