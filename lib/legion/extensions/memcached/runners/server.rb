require 'dalli'

module Legion::Extensions::Memcached
  module Runners
    module Server
      def client(payload)
        Dalli::Client.new(payload[:server] || nil)
      end

      def self.alive(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).alive? }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, server: server, **opts)
      end

      def self.flush(delay: 0, server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).flush(delay) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, delay: delay, server: server, **opts)
      end

      def self.stats(delay: 0, server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).stats(delay) }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, delay: delay, server: server, **opts)
      end

      def self.reset_stats(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).reset_stats }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, server: server, **opts)
      end

      def self.version(server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).version }
      rescue StandardError => e
        Legion::Logging.runner_exception(e, server: server, **opts)
      end
    end
  end
end
