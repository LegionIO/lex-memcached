# lex-memcached: Memcached Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Memcached servers. Provides runners for item-level cache operations and server management through the Dalli client. Also includes a standalone `Client` class for use outside the Legion runtime.

**Version**: 0.2.0

**GitHub**: https://github.com/LegionIO/lex-memcached
**License**: MIT

## Architecture

```
Legion::Extensions::Memcached
├── Client                 # Standalone client: includes all runners, manages Dalli connection
│   ├── (includes) Runners::Item
│   └── (includes) Runners::Server
├── Runners/
│   ├── Item               # Cache item ops: set, get, fetch, add, delete, append
│   └── Server             # Server management and stats
└── Helpers/
    └── Client             # Dalli client connection helper
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/memcached.rb` | Entry point, extension registration |
| `lib/legion/extensions/memcached/client.rb` | Standalone client class: includes all runners, wraps Dalli connection |
| `lib/legion/extensions/memcached/runners/item.rb` | Item runner: set, get, fetch, add, delete, append |
| `lib/legion/extensions/memcached/runners/server.rb` | Server stats and management |
| `lib/legion/extensions/memcached/helpers/client.rb` | Dalli client factory |

## Runner: Item

| Method | Parameters |
|--------|-----------|
| `set` | `key:`, `value:`, `server:`, `ttl:` |
| `get` | `key:`, `server:` |
| `fetch` | `key:`, `server:` |
| `add` | `key:`, `value:`, `ttl:`, `server:` |
| `delete` | `key:`, `server:` |
| `append` | `key:`, `value:`, `server:` |

## Runner: Server

| Method | Parameters |
|--------|-----------|
| `alive` | `server:` |
| `flush` | `delay:` (default: 0), `server:` |
| `stats` | `delay:` (default: 0), `server:` |
| `reset_stats` | `server:` |
| `version` | `server:` |

## Standalone Usage

`Legion::Extensions::Memcached::Client` can be used independently of the Legion runtime. It accepts a `server:` kwarg (default: `'127.0.0.1:11211'`) and includes all Item and Server runner methods directly.

```ruby
mc = Legion::Extensions::Memcached::Client.new(server: '10.0.0.1:11211')
mc.set(key: 'foo', value: 'bar', server: '10.0.0.1:11211', ttl: 300)
mc.get(key: 'foo', server: '10.0.0.1:11211')
```

Per-call connection options can be overridden; the `client` method merges instance opts with any call-level overrides before building the `Dalli::Client`.

## Dependencies

| Gem | Purpose |
|-----|---------|
| `dalli` (>= 3.0) | Memcached Ruby client |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
