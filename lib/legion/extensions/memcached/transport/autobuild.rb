require 'legion/extensions/transport/autobuild'

module Legion
  module Extensions
    module Memcached
      module Transport
        module AutoBuild
          extend Legion::Extensions::Transport::AutoBuild
          def self.e_to_q
            [{
              from: 'memcached',
              to: 'memcached'
            }, {
              from: 'memcached',
              to: 'item',
              routing_key: 'item'
            }, {
              from: 'memcached',
              to: 'server',
              routing_key: 'server'
            }]
          end
        end
      end
    end
  end
end
