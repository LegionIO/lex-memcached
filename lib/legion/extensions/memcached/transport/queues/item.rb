module Legion
  module Extensions
    module Memcached
      module Transport
        module Queues
          class Item < Legion::Transport::Queue
            def queue_name
              'memcached.item'
            end
          end
        end
      end
    end
  end
end
