# frozen_string_literal: true

require 'spec_helper'
require 'legion/extensions/memcached/client'

RSpec.describe Legion::Extensions::Memcached::Client do
  let(:mock_dalli) { double('Dalli::Client') }

  before do
    allow(Dalli::Client).to receive(:new).and_return(mock_dalli)
  end

  describe '#initialize' do
    it 'stores default options' do
      client = described_class.new
      expect(client.opts).to eq({ server: '127.0.0.1:11211' })
    end

    it 'accepts a custom server' do
      client = described_class.new(server: '10.0.0.1:11211')
      expect(client.opts).to include(server: '10.0.0.1:11211')
    end

    it 'accepts extra options' do
      client = described_class.new(server: '10.0.0.1:11211', compress: true)
      expect(client.opts).to include(server: '10.0.0.1:11211', compress: true)
    end
  end

  describe '#client' do
    it 'creates a Dalli::Client with the stored server' do
      client = described_class.new(server: 'memcache.local:11211')
      client.client
      expect(Dalli::Client).to have_received(:new).with('memcache.local:11211')
    end

    it 'passes extra opts to Dalli::Client' do
      client = described_class.new(server: 'memcache.local:11211', compress: true)
      client.client
      expect(Dalli::Client).to have_received(:new).with('memcache.local:11211', compress: true)
    end

    it 'allows per-call server override' do
      client = described_class.new(server: '127.0.0.1:11211')
      client.client(server: 'override.local:11211')
      expect(Dalli::Client).to have_received(:new).with('override.local:11211')
    end

    it 'returns the Dalli::Client instance' do
      client = described_class.new
      result = client.client
      expect(result).to eq(mock_dalli)
    end
  end

  describe 'runner methods' do
    let(:client_instance) { described_class.new }

    it 'responds to Item runner methods' do
      expect(client_instance).to respond_to(:set, :get, :fetch, :add, :delete, :append)
    end

    it 'responds to Server runner methods' do
      expect(client_instance).to respond_to(:alive, :flush, :stats, :reset_stats, :version)
    end
  end
end
