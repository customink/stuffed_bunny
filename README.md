# StuffedBunny

Provides stubbing of the Bunny gem to faciliate testing.

A `routed_messages` array captures any publised messages on a topic exchange.

## Example Usage

```ruby
require 'stuffed_bunny' # Bunny is overriden once this is required

class SomeTest < TestUnit::TestCase

  def setup
    @bunny = Bunny::Client.new
  end

  def teardown
    StuffedBunny.reset! # resets the routed_messages
  end

  def test_that_a_message_is_published_to_an_exchange
    exchange_options = { } # set it to be a topic exchange, etc.
    Bunny.run do |b|
      topic_exchange = b.exchange( "a_topic_exchange", exchange_options)
      publish_options = { :key => "a.routing.key" }
      topic_exchange.publish("a message", publish_options)
    end

    routed_message = @bunny.exchanges["a_topic_exchange"].routed_messages[0]
    assert_equal "a.routing.key", routed_message.key
    assert_equal "a message", routed_message.message
  end

end
```

## Installation

Add this line to your application's Gemfile:

    group :test do
      # Note that as soon as the gem is required, Bunny is overridden.
      gem 'stuffed_bunny', :require => false
    end

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stuffed_bunny

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
