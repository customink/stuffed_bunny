# StuffedBunny

Provides stubbing of the Bunny gem.

To faciliate testing, exchanges are represented as a class-level hash. This
allows all bunny instances access to the same exchanges.

## Installation

Add this line to your application's Gemfile:

    gem 'stuffed_bunny'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install stuffed_bunny

## Usage

### RSpec Example

```ruby
# spec/spec_helper.rb
require 'stuffed_bunny'

RSpec.configure do |config|

  config.after(:each) do
    StuffedBunny.reset!
  end

end
```

### Minitest Example

```ruby
require 'stuffed_bunny'

class MiniTest::Spec

  after :each do
    StuffedBunny.reset!
  end

end
```

### TestUnit Example

```ruby
require 'stuffed_bunny'

class SomeTest < TestUnit::TestCase

  def teardown
    StuffedBunny.reset!
  end

end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
