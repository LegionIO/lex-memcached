# frozen_string_literal: true

module Legion
  module Extensions
    module Memcached
      module Runners
        module Server
          include Legion::Extensions::Memcached::Helpers::Client

          def alive(server: nil, **)
            { success: true, result: client(server: server, **).alive?, **opts }
          end

          def flush(delay: 0, server: nil, **opts)
            { success: true, result: Dalli::Client.new(server).flush(delay), **opts }
          end

          def stats(delay: 0, server: nil, **)
            { success: true, result: client(server: server, **).stats(delay), **opts }
          end

          def reset_stats(server: nil, **)
            { success: true, result: client(server: server, **).reset_stats, **opts }
          end

          def version(server: nil, **)
            { success: true, result: client(server: server, **).version, **opts }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
