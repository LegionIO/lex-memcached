module Legion
  module Extensions
    module Memcached
      module Transport
        module Queues
          class Memcached < Legion::Transport::Queue
            def queue_name
              'memcached'
            end
          end
        end
      end
    end
  end
end
