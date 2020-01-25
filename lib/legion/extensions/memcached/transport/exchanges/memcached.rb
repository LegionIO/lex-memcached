module Legion
  module Extensions
    module Memcached
      module Transport
        module Exchanges
          class Memcached < Legion::Transport::Exchange
            def exchange_name
              'memcached'
            end
          end
        end
      end
    end
  end
end
