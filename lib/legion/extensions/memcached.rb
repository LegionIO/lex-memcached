# frozen_string_literal: true

require 'legion/extensions/memcached/version'
require 'legion/extensions/memcached/helpers/client'
require 'legion/extensions/memcached/runners/item'
require 'legion/extensions/memcached/runners/server'
require 'legion/extensions/memcached/client'

module Legion
  module Extensions
    module Memcached
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
