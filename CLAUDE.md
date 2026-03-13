# lex-memcached: Memcached Integration for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Memcached servers. Provides runners for item-level cache operations and server management through the Dalli client.

**GitHub**: https://github.com/LegionIO/lex-memcached
**License**: MIT

## Architecture

```
Legion::Extensions::Memcached
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
