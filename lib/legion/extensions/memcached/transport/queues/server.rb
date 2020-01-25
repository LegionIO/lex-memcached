module Legion
  module Extensions
    module Memcached
      module Transport
        module Queues
          class Server < Legion::Transport::Queue
            def queue_name
              'memcached.server'
            end
          end
        end
      end
    end
  end
end
