require 'bunny'

# Overriding the Bunny gem's modules and classes.
#
# NOTE: Not everything is stubbed yet.  We've only stubbed the method calls we
# are using in our projects.
module Bunny
  def self.run(options = {})
    bunny = Bunny::Client.new(options)
    yield bunny
  end

  # Resets the class-level exchanges.
  def self.reset_exchanges
    Bunny::Client.send(:class_variable_set, :@@exchanges, {})
  end

  class Client
    @@exchanges = {} # class variable simulating exchanges in the message broker

    def initialize(options = {})
    end

    def exchange(name, options = {})
      @@exchanges[name] ||= Bunny::Exchange.new(self, name, options)
    end

    # Expose the exchanges.
    def exchanges
      @@exchanges
    end

    def queue(queue_name, options=nil)
      Bunny::Queue.new nil
    end
  end

  class Exchange
    attr_accessor :client, :type, :name, :routed_messages

    def initialize(client, name, options = {})
      @client, @name  = client, name
      @routed_messages = []
      @type = options[:type]
    end

    # To facilite testing this adds a Struct containing the data
    # +message+ and routing +key+ to the +routed_messages+.
    #
    # Example usage:
    # Bunny.run do |b|
    #   topic = b.exchange("some_topic_name", MH::Exchange::OPTIONS)
    #   options = { :key => "some.routing.key" }.merge(MH::Exchange::PUBLISH_OPTIONS)
    #   topic.publish("some message", options)
    # end
    #
    # Testing:
    # ...
    # routed_message = @bunny.exchanges["some_topic_name"].routed_messages[0]
    # assert_equal "some message", routed_message.message
    # assert_equal "some.routing.key", routed_message.key
    def publish(data, options = {})
      @routed_messages << Struct.new(:message, :key).new(data, options[:key])
    end
  end

  class Queue
    def initialize(channel_or_connection, name = nil, opts = {})
    end
    def delete(*args)
      :delete_ok
    end
  end
end
