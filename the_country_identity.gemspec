# -*- encoding: utf-8 -*-
require File.expand_path('../lib/the_country_identity/version', __FILE__)

Gem::Specification.new do |gem|
  
  gem.name          = "the_country_identity"
  gem.version       = TheCountryIdentity::VERSION
  gem.authors       = ["Raul Pino"]
  gem.email         = ["ipinoraul@gmail.com"]
  gem.description   = %q{CIA World Factbook crawler}
  gem.summary       = %q{Fetch data from CIA World Factbook}
  gem.homepage      = "https://github.com/p1nox/the_country_identity"

  gem.files         = `git ls-files`.split($\)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})  
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }  
  gem.require_paths = ["lib"]

  gem.add_dependency "nokogiri"           # XML Parsing
  
end
