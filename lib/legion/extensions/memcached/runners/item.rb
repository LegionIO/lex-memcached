module Legion::Extensions::Memcached
  module Runners
    module Item
      include Legion::Extensions::Memcached::Helpers::Client

      def set(key:, value:, server: nil, **opts)
        client(server: server, **opts).set(key, value, opts[:ttl])
        { success: true, key: key, value: value, server: server, **opts }
      end

      def get(key:, server: nil, **opts)
        { success: true, get: client(server: server, **opts).get(key), **opts }
      end

      def fetch(key:, server: nil, **opts)
        { success: true, fetch: client(server: server, **opts).fetch(key), **opts }
      end

      def add(key:, value:, ttl:, server: nil, **opts)
        { success: true, add: client(server: server, **opts).add(key, value, ttl), **opts }
      end

      def delete(key:, server: nil, **opts)
        { success: true, delete: client(server: server, **opts).delete(key), **opts }
      end

      def append(key:, value:, server: nil, **opts)
        { success: true, append: client(server: server, **opts).append(key, value), **opts }
      end

      include Legion::Extensions::Helpers::Lex
    end
  end
end
