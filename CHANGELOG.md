# Changelog

## [0.2.1] - 2026-03-18

### Fixed
- `runners/item.rb`: named anonymous `**` splat as `**opts` in `get`, `fetch`, `add`, `delete`, and `append` methods to fix `NameError` at runtime
- `runners/server.rb`: `flush` now uses `client(server: server, **opts)` helper instead of bypassing it with `Dalli::Client.new` directly
- Added `if defined?(Legion::Extensions::Helpers::Lex)` guard to both runner files for standalone loading

### Added
- `spec.license = 'MIT'` in gemspec
- `Gemfile.lock` added to `.gitignore`
- Uncommented and fully implemented specs for `Runners::Item`, `Runners::Server`, and `Helpers::Client`
- Entry point `memcached.rb` now requires helpers and runners explicitly

## [0.2.0] - 2026-03-15

### Added
- Standalone `Client` class (`Legion::Extensions::Memcached::Client`) that includes all Runner modules (`Item`, `Server`), stores connection options, and provides a `client(**override)` method for creating `Dalli::Client` instances outside the full LegionIO framework
- Specs for the standalone `Client` class

## [0.1.3] - prior

### Added
- Initial implementation with `Item` and `Server` runners
- `Helpers::Client` wrapping `Dalli::Client`
