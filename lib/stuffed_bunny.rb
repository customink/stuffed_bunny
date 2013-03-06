require 'stuffed_bunny/version'
require 'stuffed_bunny/bunny_overrides'

module StuffedBunny
  # Call this in a test's teardown method to clear messages in the exchanges.
  def self.reset!
    Bunny.reset_exchanges
  end
end
