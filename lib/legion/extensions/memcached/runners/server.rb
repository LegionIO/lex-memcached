module Legion::Extensions::Memcached
  module Runners
    module Server
      include Legion::Extensions::Memcached::Helpers::Client

      def alive(server: nil, **opts)
        { success: true, result: client(server: server, **opts).alive?, **opts }
      end

      def flush(delay: 0, server: nil, **opts)
        { success: true, result: Dalli::Client.new(server).flush(delay), **opts }
      end

      def stats(delay: 0, server: nil, **opts)
        { success: true, result: client(server: server, **opts).stats(delay), **opts }
      end

      def reset_stats(server: nil, **opts)
        { success: true, result: client(server: server, **opts).reset_stats, **opts }
      end

      def version(server: nil, **opts)
        { success: true, result: client(server: server, **opts).version, **opts }
      end

      include Legion::Extensions::Helpers::Lex
    end
  end
end
