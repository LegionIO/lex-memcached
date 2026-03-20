# lex-memcached

Memcached integration for [LegionIO](https://github.com/LegionIO/LegionIO). Run cache operations like get, set, add, append, and delete against Memcached servers via the Dalli client.

## Installation

```bash
gem install lex-memcached
```

Or add to your Gemfile:

```ruby
gem 'lex-memcached'
```

## Standalone Usage

```ruby
require 'legion/extensions/memcached'

client = Legion::Extensions::Memcached::Client.new(server: '10.0.0.1:11211')
client.set(key: 'foo', value: 'bar', server: '10.0.0.1:11211', ttl: 300)
client.get(key: 'foo', server: '10.0.0.1:11211')
client.stats(server: '10.0.0.1:11211')
```

Constructor accepts `server:` (default `'127.0.0.1:11211'`).

## Runners

| Runner | Methods |
|--------|---------|
| Item | `set`, `get`, `fetch`, `add`, `delete`, `append` |
| Server | Server management and stats |

### Item Parameters

| Method | Required | Optional |
|--------|----------|----------|
| `set` | `key`, `value` | `server`, `ttl` |
| `get` | `key` | `server` |
| `fetch` | `key` | `server` |
| `add` | `key`, `value`, `ttl` | `server` |
| `delete` | `key` | `server` |
| `append` | `key`, `value` | `server` |

## Requirements

- Ruby >= 3.4
- Memcached server
- [LegionIO](https://github.com/LegionIO/LegionIO) framework (optional — standalone Client works without it)

## License

MIT
