require_relative 'spec_helper'

describe Bunny::Queue do
  before do
    @queue = Bunny::Queue.new nil
  end

  describe 'on .delete' do
    it 'return the :delete_ok symbol' do
      @queue.delete.must_equal :delete_ok
    end
  end
end
