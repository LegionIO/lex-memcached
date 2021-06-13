lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'legion/extensions/memcached/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-memcached'
  spec.version       = Legion::Extensions::Memcached::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::Memcached'
  spec.description   = 'LegionIO Extensions to connect to and manage memcached servers'
  spec.homepage      = 'https://github.com/LegionIO/lex-memcached'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-memcached'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-memcached'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-memcached'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/LegionIO/lex-memcached/issues'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'legionio'

  spec.add_dependency 'dalli'
end
