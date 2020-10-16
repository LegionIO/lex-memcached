require 'dalli'

module Legion::Extensions::Memcached
  module Runners
    module Item
      def self.set(key:, value:, server: nil, **opts)
        client = Dalli::Client.new(server)
        client.set(key, value, opts[:ttl])
        { success: true, key: key, value: value, server: server, **opts }
      end

      def self.get(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, get: client.get(key), **opts }
      end

      def self.fetch(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, fetch: client.fetch(key), **opts }
      end

      def self.add(key:, value:, ttl:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, add: client.add(key, value, ttl), **opts }
      end

      def self.delete(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, delete: client.delete(key), **opts }
      end

      def self.append(key:, value:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, append: client.append(key, value), **opts }
      end
    end
  end
end
