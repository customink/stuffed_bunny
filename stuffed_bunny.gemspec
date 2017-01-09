# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stuffed_bunny/version'

Gem::Specification.new do |gem|
  gem.name          = 'stuffed_bunny'
  gem.version       = StuffedBunny::VERSION
  gem.authors       = ['Chris Murphy', 'Derek Lindahl']
  gem.email         = ["cmurphy@customink.com"]
  gem.description   = %q{Provides stubbing of the Bunny gem.}
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/customink/stuffed_bunny'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_development_dependency 'bunny', '~> 0.8', '<= 1.4.1'
  gem.add_development_dependency 'rake'
end
