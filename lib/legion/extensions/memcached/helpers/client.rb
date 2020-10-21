require 'dalli'

module Legion
  module Extensions
    module Memcached
      module Helpers
        module Client
          def client(server: '127.0.0.1:11211', **opts)
            Dalli::Client.new(server, **opts)
          end
        end
      end
    end
  end
end
