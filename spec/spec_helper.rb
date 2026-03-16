# frozen_string_literal: true

begin
  require 'simplecov'
  SimpleCov.start do
    add_filter '/spec/'
  end
  if ENV.key?('CODECOV_TOKEN')
    require 'codecov'
    SimpleCov.formatter = SimpleCov::Formatter::Codecov
  end
rescue LoadError
  puts 'Failed to load file for coverage reports, continuing without it'
end

require 'bundler/setup'

# Stub Legion::Extensions::Helpers::Lex before loading any runners.
# In production the full LegionIO framework provides this; in specs we
# replicate only the behaviour the runner files actually rely on.
module Legion
  module Extensions
    module Helpers
      module Lex
        def self.included(base)
          base.extend base if base.instance_of?(Module)
        end
      end
    end
  end
end

require 'legion/logging'
Legion::Logging.setup(level: 'error')
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
