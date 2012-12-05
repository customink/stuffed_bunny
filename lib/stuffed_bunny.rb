require 'stuffed_bunny/version'
require 'stuffed_bunny/bunny_overrides'

module StuffedBunny

  # Call this in a test's setup method to stub the Bunny gem.
  def self.reset!
    Bunny.reset_exchanges
  end

end
