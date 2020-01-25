require 'dalli'

module Legion
  module Extensions
    module Memcached
      module Runners
        module Item
          def self.set(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            client.set(payload[:key], payload[:value], payload[:ttl])
            { success: true, key: payload[:key], value: payload[:value] }
          rescue StandardError => e
            { success: false, error: true, key: payload[:key], value: payload[:value], ex: { message: e.message } }
          end

          def self.get(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            { success: true, get: client.get(payload[:key]) }
          rescue StandardError => e
            { success: false, error: true, key: payload[:key], e: { message: e.message } }
          end

          def self.fetch(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            { success: true, fetch: client.fetch(payload[:key]) }
          rescue StandardError => e
            { success: false, error: true, key: payload[:key], e: { message: e.message } }
          end

          def self.add(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            { success: true, add: client.add(payload[:key], payload[:value], payload[:ttl]) }
          rescue StandardError => e
            { success: false,
              error: true,
              key: payload[:key],
              value: payload[:value],
              ttl: payload[:ttl],
              e: { message: e.message } }
          end

          def self.delete(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            { success: true, delete: client.delete(payload[:key]) }
          rescue StandardError => e
            { success: false, error: true, key: payload[:key], e: { message: e.message } }
          end

          def self.append(payload)
            client = Dalli::Client.new(payload[:server] || nil)
            { success: true, append: client.append(payload[:key], payload[:value]) }
          end
        end
      end
    end
  end
end
