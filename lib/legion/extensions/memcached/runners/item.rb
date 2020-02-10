require 'dalli'

module Legion::Extensions::Memcached
  module Runners
    module Item
      def self.set(key:, value:, server: nil, **opts)
        client = Dalli::Client.new(server)
        client.set(key, value, opts[:ttl])
        { success: true, key: key, value: value, server: server, **opts }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, value: value, server: server, **opts)
      end

      def self.get(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, get: client.get(key) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, server: server, **opts)
      end

      def self.fetch(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, fetch: client.fetch(key) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, server: server, **opts)
      end

      def self.add(key:, value:, server: nil, ttl:, **opts)
        client = Dalli::Client.new(server)
        { success: true, add: client.add(key, value, ttl) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, server: server, ttl: ttl, **opts)
      end

      def self.delete(key:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, delete: client.delete(key) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, server: server, **opts)
      end

      def self.append(key:, value:, server: nil, **opts)
        client = Dalli::Client.new(server)
        { success: true, append: client.append(key, value) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, key: key, value: value, server: server, **opts)
      end
    end
  end
end
