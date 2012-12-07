require_relative 'spec_helper'

describe Bunny do
  before do
    @client = Bunny::Client.new
  end

  describe 'on .reset_exchanges' do
    before do
      @client.exchange(:test_exchange)
    end

    it 'resets them back to an empty hash' do
      Bunny.reset_exchanges
      @client.exchanges.must_be_empty
    end
  end

  describe 'on .reset!' do
    before do
      @client.exchange(:test_exchange)
    end

    it 'resets them back to an empty hash' do
      StuffedBunny.reset!
      @client.exchanges.must_be_empty
    end
  end
end