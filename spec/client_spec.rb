require_relative 'spec_helper'

describe Bunny::Client do
  before do
    @client = Bunny::Client.new
  end

  describe 'on .new' do
    it 'returns a new Bunny::Client' do
      @client.must_be_kind_of Bunny::Client
    end
  end

  describe 'on #exchange' do
    it 'adds a new Exchange with the given name' do
      @client.exchange(:test_exchange)
      exchanges = @client.class.class_variable_get(:@@exchanges)
      exchanges[:test_exchange].wont_be_nil
    end
  end

  describe 'on #exchanges' do
    it 'returns the exchanges class variable' do
      @client.exchanges.must_equal @client.class.class_variable_get(:@@exchanges)
    end
  end
end