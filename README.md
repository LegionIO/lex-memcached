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
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- Memcached server

## License

MIT
