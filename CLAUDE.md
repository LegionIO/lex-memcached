# lex-memcached: Memcached Integration for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that connects LegionIO to Memcached servers. Provides runners for item-level cache operations and server management through the Dalli client.

**GitHub**: https://github.com/LegionIO/lex-memcached
**License**: MIT (assumed)

## Architecture

```
Legion::Extensions::Memcached
├── Runners/
│   ├── Item               # Cache item operations (get, set, delete, etc.)
│   └── Server             # Server management and stats
└── Helpers/
    └── Client             # Dalli client connection helper
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `dalli` | Memcached Ruby client |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
