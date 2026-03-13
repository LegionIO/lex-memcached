# frozen_string_literal: true

require 'dalli'

module Legion
  module Extensions
    module Memcached
      module Helpers
        module Client
          def client(server: '127.0.0.1:11211', **)
            Dalli::Client.new(server, **)
          end
        end
      end
    end
  end
end
