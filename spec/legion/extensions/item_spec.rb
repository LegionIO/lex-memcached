# frozen_string_literal: true

require 'spec_helper'
require 'dalli'
require 'legion/extensions/memcached/helpers/client'
require 'legion/extensions/memcached/runners/item'

RSpec.describe Legion::Extensions::Memcached::Runners::Item do
  let(:dalli_double) { instance_double(Dalli::Client) }

  let(:runner) do
    klass = Class.new do
      include Legion::Extensions::Memcached::Runners::Item

      define_method(:client) { |**_opts| nil }
    end
    instance = klass.new
    allow(instance).to receive(:client).and_return(dalli_double)
    instance
  end

  before do
    allow(dalli_double).to receive(:set).and_return(true)
    allow(dalli_double).to receive(:get).and_return('bar')
    allow(dalli_double).to receive(:fetch).and_return('bar')
    allow(dalli_double).to receive(:add).and_return(true)
    allow(dalli_double).to receive(:delete).and_return(true)
    allow(dalli_double).to receive(:append).and_return(true)
  end

  describe '#set' do
    it 'returns a hash with success: true' do
      result = runner.set(key: 'foo', value: 'bar')
      expect(result[:success]).to be(true)
    end

    it 'includes the key in the result' do
      result = runner.set(key: 'foo', value: 'bar')
      expect(result[:key]).to eq('foo')
    end

    it 'includes the value in the result' do
      result = runner.set(key: 'foo', value: 'bar')
      expect(result[:value]).to eq('bar')
    end

    it 'calls set on the dalli client' do
      runner.set(key: 'foo', value: 'bar')
      expect(dalli_double).to have_received(:set).with('foo', 'bar', nil)
    end
  end

  describe '#get' do
    it 'returns a hash with success: true' do
      result = runner.get(key: 'foo')
      expect(result[:success]).to be(true)
    end

    it 'includes the get result' do
      result = runner.get(key: 'foo')
      expect(result[:get]).to eq('bar')
    end

    it 'calls get on the dalli client' do
      runner.get(key: 'foo')
      expect(dalli_double).to have_received(:get).with('foo')
    end
  end

  describe '#fetch' do
    it 'returns a hash with success: true' do
      result = runner.fetch(key: 'foo')
      expect(result[:success]).to be(true)
    end

    it 'includes the fetch result' do
      result = runner.fetch(key: 'foo')
      expect(result[:fetch]).to eq('bar')
    end

    it 'calls fetch on the dalli client' do
      runner.fetch(key: 'foo')
      expect(dalli_double).to have_received(:fetch).with('foo')
    end
  end

  describe '#add' do
    it 'returns a hash with success: true' do
      result = runner.add(key: 'foo', value: 'bar', ttl: 60)
      expect(result[:success]).to be(true)
    end

    it 'calls add on the dalli client with key, value, ttl' do
      runner.add(key: 'foo', value: 'bar', ttl: 60)
      expect(dalli_double).to have_received(:add).with('foo', 'bar', 60)
    end
  end

  describe '#delete' do
    it 'returns a hash with success: true' do
      result = runner.delete(key: 'foo')
      expect(result[:success]).to be(true)
    end

    it 'calls delete on the dalli client' do
      runner.delete(key: 'foo')
      expect(dalli_double).to have_received(:delete).with('foo')
    end
  end

  describe '#append' do
    it 'returns a hash with success: true' do
      result = runner.append(key: 'foo', value: '_extra')
      expect(result[:success]).to be(true)
    end

    it 'calls append on the dalli client with key and value' do
      runner.append(key: 'foo', value: '_extra')
      expect(dalli_double).to have_received(:append).with('foo', '_extra')
    end
  end
end
