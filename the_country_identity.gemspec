# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'the_country_identity/version'

Gem::Specification.new do |gem|

  gem.name          = 'the_country_identity'
  gem.version       = TheCountryIdentity::VERSION
  gem.authors       = ['Raul Pino']
  gem.email         = ['ipinoraul@gmail.com']
  gem.description   = %q{CIA World Factbook crawler}
  gem.summary       = %q{Fetch data from CIA World Factbook}
  gem.homepage      = 'https://github.com/p1nox/the_country_identity'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_dependency 'linkeddata'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'rspec-nc'
  gem.add_development_dependency 'guard'
  gem.add_development_dependency 'guard-rspec'
  gem.add_development_dependency 'pry'
  gem.add_development_dependency 'pry-remote'
  gem.add_development_dependency 'pry-nav'
  gem.add_development_dependency 'coveralls'

end
