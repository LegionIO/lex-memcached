require 'legion/extensions/memcached/version'

module Legion
  module Extensions
    module Memcached
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
