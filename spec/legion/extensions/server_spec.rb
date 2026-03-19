# frozen_string_literal: true

require 'spec_helper'
require 'dalli'
require 'legion/extensions/memcached/helpers/client'
require 'legion/extensions/memcached/runners/server'

RSpec.describe Legion::Extensions::Memcached::Runners::Server do
  let(:dalli_double) { double('Dalli::Client') }

  let(:runner) do
    klass = Class.new do
      include Legion::Extensions::Memcached::Runners::Server

      define_method(:client) { |**_opts| nil }
    end
    instance = klass.new
    allow(instance).to receive(:client).and_return(dalli_double)
    instance
  end

  before do
    allow(dalli_double).to receive(:alive?).and_return(true)
    allow(dalli_double).to receive(:flush).and_return(true)
    allow(dalli_double).to receive(:stats).and_return({})
    allow(dalli_double).to receive(:reset_stats).and_return(true)
    allow(dalli_double).to receive(:version).and_return('1.6.0')
  end

  describe '#alive' do
    it 'returns a hash with success: true' do
      result = runner.alive
      expect(result[:success]).to be(true)
    end

    it 'calls alive? on the dalli client' do
      runner.alive
      expect(dalli_double).to have_received(:alive?)
    end

    it 'includes the result key' do
      result = runner.alive
      expect(result).to have_key(:result)
    end
  end

  describe '#flush' do
    it 'returns a hash with success: true' do
      result = runner.flush
      expect(result[:success]).to be(true)
    end

    it 'calls flush on the dalli client (not Dalli::Client.new directly)' do
      runner.flush
      expect(dalli_double).to have_received(:flush).with(0)
    end

    it 'passes the delay argument to flush' do
      runner.flush(delay: 5)
      expect(dalli_double).to have_received(:flush).with(5)
    end
  end

  describe '#stats' do
    it 'returns a hash with success: true' do
      result = runner.stats
      expect(result[:success]).to be(true)
    end

    it 'calls stats on the dalli client' do
      runner.stats
      expect(dalli_double).to have_received(:stats)
    end
  end

  describe '#reset_stats' do
    it 'returns a hash with success: true' do
      result = runner.reset_stats
      expect(result[:success]).to be(true)
    end

    it 'calls reset_stats on the dalli client' do
      runner.reset_stats
      expect(dalli_double).to have_received(:reset_stats)
    end
  end

  describe '#version' do
    it 'returns a hash with success: true' do
      result = runner.version
      expect(result[:success]).to be(true)
    end

    it 'calls version on the dalli client' do
      runner.version
      expect(dalli_double).to have_received(:version)
    end

    it 'includes the version in the result' do
      result = runner.version
      expect(result[:result]).to eq('1.6.0')
    end
  end
end
