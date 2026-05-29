# Stuffed Bunny

Ruby gem for stubbing the Bunny (RabbitMQ) gem in tests. Captures published messages on topic exchanges for assertion.

## Tech Stack

- **Language:** Ruby (see `stuffed_bunny.gemspec` for dependencies)
- **Type:** Gem (consumed via Bundler)

## Local Development & Testing

Run `bundle install` and `bundle exec rake spec`. Test framework: RSpec.

## Key Directories

| Path | Purpose |
|------|---------|
| `lib/stuffed_bunny/` | Stubbed Bunny client, channel, exchange, and queue classes |
| `spec/` | RSpec suite |

## Architecture Notes

- Overrides `Bunny::Client` once required — no explicit setup needed
- `routed_messages` array captures messages published on topic exchanges
- Used by other Custom Ink services for testing RabbitMQ workflows
