# -*- encoding: utf-8 -*-
require File.expand_path('../lib/linkedin_scraper/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ['Yatish Mehta', 'Drew Lee']
  gem.description   = %q{Scrapes the linkedin profile or linkedin company page when a url is given }
  gem.summary       = %q{when a url of public linkedin profile page or company page is given it scrapes the entire page and converts into a accessible object}
  gem.homepage      = 'https://github.com/yatishmehta27/linkedin-scraper'
  gem.files         = `git ls-files`.split($\)
  gem.executables   = ['linkedin-scraper']
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = 'mirari-linkedin'
  gem.require_paths = ['lib']
  gem.version       = Linkedin::Scraper::VERSION

  gem.license       = "MIT"

  gem.add_dependency 'mechanize', '~> 2'

  gem.add_development_dependency 'rspec', '~> 3'
  gem.add_development_dependency 'rake', '~> 10'
end
