require 'bundler/gem_tasks'
require 'rake/testtask'

desc 'Default: run minispec specs.'
task default: :test

Rake::TestTask.new do |t|
  t.libs << "lib"
  t.pattern = 'spec/**/*_spec.rb'
  t.verbose = true
end
