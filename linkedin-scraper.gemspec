# -*- encoding: utf-8 -*-
require File.expand_path('../lib/linkedin-scraper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Yatish Mehta', 'Drew Lee']
  gem.description   = %q{Scrapes the linkedin profile or linkedin company page when a url is given }
  gem.summary       = %q{when a url of public linkedin profile page or company page is given it scrapes the entire page and converts into a accessible object}
  gem.homepage      = 'https://github.com/drwl/mirari-linkedin'
  gem.files         = `git ls-files`.split($\)
  gem.executables   = ['linkedin-scraper']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'mirari-linkedin'
  gem.require_paths = ['lib']
  gem.version       = Linkedin::Scraper::VERSION

  gem.add_dependency(%q<mechanize>, ['>= 0'])
  
  gem.add_development_dependency 'rspec', '>=0'
  gem.add_development_dependency 'rake'

end
