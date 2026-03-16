# frozen_string_literal: true

require_relative 'helpers/client'
require_relative 'runners/item'
require_relative 'runners/server'

module Legion
  module Extensions
    module Memcached
      class Client
        include Runners::Item
        include Runners::Server

        attr_reader :opts

        def initialize(server: '127.0.0.1:11211', **extra)
          @opts = { server: server, **extra }
        end

        def client(**override)
          merged = @opts.merge(override)
          server = merged.fetch(:server)
          Dalli::Client.new(server, **merged.except(:server))
        end
      end
    end
  end
end
