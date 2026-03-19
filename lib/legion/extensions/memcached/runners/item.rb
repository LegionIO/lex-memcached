# frozen_string_literal: true

module Legion
  module Extensions
    module Memcached
      module Runners
        module Item
          include Legion::Extensions::Memcached::Helpers::Client

          def set(key:, value:, server: nil, **opts)
            client(server: server, **opts).set(key, value, opts[:ttl])
            { success: true, key: key, value: value, server: server, **opts }
          end

          def get(key:, server: nil, **)
            { success: true, get: client(server: server, **).get(key) }
          end

          def fetch(key:, server: nil, **)
            { success: true, fetch: client(server: server, **).fetch(key) }
          end

          def add(key:, value:, ttl:, server: nil, **)
            { success: true, add: client(server: server, **).add(key, value, ttl) }
          end

          def delete(key:, server: nil, **)
            { success: true, delete: client(server: server, **).delete(key) }
          end

          def append(key:, value:, server: nil, **)
            { success: true, append: client(server: server, **).append(key, value) }
          end

          include Legion::Extensions::Helpers::Lex if defined?(Legion::Extensions::Helpers::Lex)
        end
      end
    end
  end
end
