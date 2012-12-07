ENV['RACK_ENV'] ||= 'test'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'bundler/setup'
require 'minitest/autorun'
require 'minitest/reporters'
require 'stuffed_bunny'

MiniTest::Reporters.use! MiniTest::Reporters::ProgressReporter.new