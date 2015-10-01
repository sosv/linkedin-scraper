Linkedin Scraper
================

Linkedin-scraper is a gem for scraping linkedin public profiles and company pages.

## Installation

Install the gem from RubyGems:

    gem install linkedin-scraper

This gem is tested on 1.9.2, 1.9.3, 2.0.0, JRuby1.9, rbx1.9,

## Usage

``` ruby
profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/jeffweiner08')
company = LinkedIn::Company.get_company('http://www.linkedin.com/company/1337')
```

`Linkedin::Profile` object responds to

    profile.first_name                # The first name of the contact

    profile.last_name                 # The last name of the contact

    profile.name                      # The full name of the contact

    profile.title                     # The contact's title

    profile.summary                   # The summary of the profile

    profile.location                  # The location of the contact

    profile.country                   # The country of the contact

    profile.industry                  # The domain for which the contact belongs

    profile.picture                   # The profile picture link of profile

    profile.skills                    # Array of skills of the profile

    profile.organizations             # Array organizations of the profile

    profile.education                 # Array of hashes for education

    profile.websites                  # Array of websites

    profile.groups                    # Array of groups

    profile.languages                 # Array of languages

    profile.certifications            # Array of certifications

    profile.number_of_connections     # The number of connections as a string


For current and past companies it also provides the details of the companies like company size, industry, address, etc

The gem also comes with a binary and can be used from the command line to get a json response of the scraped data.
It takes the url as the first argument.

    linkedin-scraper http://www.linkedin.com/in/jeffweiner08


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yatish27/linkedin-scraper.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the
[Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
