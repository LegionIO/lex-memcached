# frozen_string_literal: true

module Legion
  module Extensions
    module Memcached
      module Runners
        module Server
          include Legion::Extensions::Memcached::Helpers::Client

          def alive(server: nil, **)
            { success: true, result: client(server: server, **).alive? }
          end

          def flush(server: nil, delay: 0, **)
            { success: true, result: client(server: server, **).flush(delay) }
          end

          def stats(delay: 0, server: nil, **)
            { success: true, result: client(server: server, **).stats(delay) }
          end

          def reset_stats(server: nil, **)
            { success: true, result: client(server: server, **).reset_stats }
          end

          def version(server: nil, **)
            { success: true, result: client(server: server, **).version }
          end

          include Legion::Extensions::Helpers::Lex if defined?(Legion::Extensions::Helpers::Lex)
        end
      end
    end
  end
end
