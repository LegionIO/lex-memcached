# Changelog

## [0.2.0] - 2026-03-15

### Added
- Standalone `Client` class (`Legion::Extensions::Memcached::Client`) that includes all Runner modules (`Item`, `Server`), stores connection options, and provides a `client(**override)` method for creating `Dalli::Client` instances outside the full LegionIO framework
- Specs for the standalone `Client` class

## [0.1.3] - prior

### Added
- Initial implementation with `Item` and `Server` runners
- `Helpers::Client` wrapping `Dalli::Client`
