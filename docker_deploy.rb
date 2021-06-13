#!/usr/bin/env ruby

long_name = 'lex-memcached'
name = 'memcached'
require "./lib/legion/extensions/#{name}/version"
version = Legion::Extensions::Memcached::VERSION

system("gem build #{long_name}.gemspec")
system("gh release create v#{version} '#{long_name}-#{version}.gem'")
system("gem push #{long_name}-#{version}.gem")
system("gem push --key github --host https://rubygems.pkg.github.com/LegionIO #{long_name}-#{version}.gem")

puts "Building docker image for Legion v#{version}"
system("docker build --tag legionio/lex-#{name}:v#{version} .")
puts 'Pushing to hub.docker.com'
system("docker push legionio/lex-#{name}:v#{version}")
system("docker push legionio/lex-#{name}:latest")
puts 'completed'
