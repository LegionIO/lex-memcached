require 'dalli'

module Legion::Extensions::Memcached
  module Runners
    module Server
      def client(payload)
        Dalli::Client.new(payload[:server] || nil)
      end

      def self.alive(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).alive?, **opts }
      end

      def self.flush(delay: 0, server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).flush(delay), **opts }
      end

      def self.stats(delay: 0, server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).stats(delay), **opts }
      end

      def self.reset_stats(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).reset_stats, **opts }
      end

      def self.version(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).version, **opts }
      end
    end
  end
end
