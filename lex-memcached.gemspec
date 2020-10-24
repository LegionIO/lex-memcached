lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legion/extensions/memcached/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-memcached'
  spec.version       = Legion::Extensions::Memcached::VERSION
  spec.authors       = ['Miverson']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Memcached'
  spec.description   = 'LEX::Memcached'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-memcached'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-memcached'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614858753'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614858760'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-memcached/issues'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'codecov'
  spec.add_development_dependency 'legionio'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'dalli'
end
