require 'dalli'

module Legion
  module Extensions
    module Memcached
      module Runners
        module Server
          def client(payload)
            Dalli::Client.new(payload[:server] || nil)
          end

          def self.alive(payload)
            { success: true, alive: client(payload).alive? }
          rescue StandardError => e
            { success: false, error: true, error_message: e.message }
          end

          def self.flush(payload)
            { success: true, flush: client(payload).flush(payload[:delay] || nil) }
          rescue StandardError => e
            { success: false, error: true, error_message: e.message }
          end

          def self.stats(payload)
            { success: true, stats: client(payload).stats(payload[:delay] || nil) }
          rescue StandardError => e
            { success: false, error: true, error_message: e.message }
          end

          def self.reset_stats(payload)
            { success: true, reset_stats: client(payload).reset_stats }
          rescue StandardError => e
            { success: false, error: true, error_message: e.message }
          end

          def self.version(payload)
            { success: true, version: client(payload).version }
          rescue StandardError => e
            { success: false, error: true, error_message: e.message }
          end
        end
      end
    end
  end
end
