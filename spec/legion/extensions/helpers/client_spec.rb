# frozen_string_literal: true

require 'spec_helper'
require 'dalli'
require 'legion/extensions/memcached/helpers/client'

RSpec.describe Legion::Extensions::Memcached::Helpers::Client do
  let(:host) do
    klass = Class.new do
      include Legion::Extensions::Memcached::Helpers::Client
    end
    klass.new
  end

  describe '#client' do
    it 'returns a Dalli::Client' do
      expect(host.client).to be_a(Dalli::Client)
    end

    it 'accepts a server keyword argument' do
      expect { host.client(server: '127.0.0.1:11211') }.not_to raise_error
    end

    it 'returns a new instance on each call' do
      first  = host.client
      second = host.client
      expect(first).not_to be(second)
    end
  end
end
