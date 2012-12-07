require_relative 'spec_helper'

describe Bunny::Exchange do
  before do
    client = Bunny::Client.new
    @exchange = Bunny::Exchange.new(client, :test_name)
  end


  describe 'on .new' do
    it 'should have expected accessors' do
      [:client, :type, :name, :routed_messages].each do |accessor|
        @exchange.must_respond_to accessor
      end
    end

    it 'initialize routed_messages to an array' do
      @exchange.routed_messages.must_be_kind_of Array
    end
  end

  describe 'after #publish' do
    before do
      @data    = "some data"
      @options = { key: "some_routing_key" }
      @exchange.publish(@data, @options)
      @routed_message = @exchange.routed_messages.first
    end

    it 'should have a routed message that exposes the data' do
      @routed_message.message.must_equal @data
    end

    it 'should have a routed message that exposes the key' do
      @routed_message.key.must_equal @options[:key]
    end
  end
end
