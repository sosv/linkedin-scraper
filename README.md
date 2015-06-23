Mirari Linkedin
================

Mirari-linkedin is a fork of yatish27/linkedin-scraper, a gem for scraping Linkedin profiles that extends functionality to Linkedin company pages.
Given the URL of the profile, it gets the name, country, title, area, current companies, past companies, organizations, skills, groups, etc.
Given the URL of the company page, it gets the company id, description, name, company size, address, etc.
See below for example outputs. This fork behaves differently for Linkedin profiles.

##Usage

There is a binary that takes either a linkedin profile page or linkedin company page. Try this in your terminal after installing the gem.

`$ linkedin-scraper http://www.linkedin.com/in/jeffweiner08`

`$ linkedin-scraper http://www.linkedin.com/company/1337`

### Basic Setup

``` ruby
require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'mirari-linkedin'

profile = Linkedin::Profile.get_profile('http://www.linkedin.com/in/jeffweiner08')
company = LinkedIn::Company.get_company('http://www.linkedin.com/company/1337')
```

`Linkedin::Profile` object responds to

    profile.name                      # The full name of the contact

    profile.first_name                # The first name of the contact

    profile.last_name                 # The last name of the contact

    profile.title                     # The contact's title

    profile.location                  # The location of the contact

    profile.industry                  # The industry of the contact

    profile.summary                   # The summary of the profile

    profile.picture                   # Image link to contact's photo

    profile.education                 # Array of different schools for profile

    profile.groups                    # Array of different groups the contact belongs to

    profile.websites                  # Array of websites

    profile.languages                 # Array of languages

    profile.skills                    # Array of endorsed skills

    profile.certifications            # Array of certifications

    profile.organizations             # Array of organizations the contact belongs to

    profile.past_companies            # An array of hashes that has company information of past roles

    profile.current_companies         # An array of hashes has company information of current roles

    profile.similar_named             # An array of hashes that contain profiles that have the same name

    profile.recommended_visitors      # An array of hashes that contains other profiles that are recommended

    profile.headline                  # Alias of .title

    profile.member_id                 # A number that has the unique LinkedIn member ID

    profile.num_connections           # The number of connections (highest is '500+')

    profile.influencer?               # A boolean of whether or not the contact has the INfluencer badge

This differs from `yatish27/linkedin-scraper` on what companies information is shown. This way only 1 HTTP request is used per profile.

    profile.current_companies

    [{
      "title": "CEO",
      "company": "LinkedIn",
      "start_date": "2008-12-01",
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/1337?trk=ppro_cprof"
    },
    {
      "title": "Member, Board of Directors",
      "company": "Intuit",
      "start_date": "2012-04-01",
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/1666?trk=ppro_cprof"
    },
    {
      "title": "Member, Board of Directors",
      "company": "DonorsChoose",
      "start_date": null,
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/33101?trk=ppro_cprof"
    },
    {
      "title": "Member, Board of Directors",
      "company": "Malaria No More",
      "start_date": null,
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/695380?trk=ppro_cprof"
    },
    {
      "title": "Member, Advisory Board",
      "company": "Boys & Girls Clubs of the Peninsula",
      "start_date": null,
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/66930?trk=ppro_cprof"
    },
    {
      "title": "Member, Advisory Board",
      "company": "Venture For America",
      "start_date": null,
      "end_date": null,
      "linkedin_company_url": "http://www.linkedin.com/company/1904212?trk=ppro_cprof"
    }]

You can do indepth company page scrape.

    puts company.to_json
    {
      "linkedin_url": "http://www.linkedin.com/company/linkedin",
      "company_id": "1337",
      "profile_url": "http://www.linkedin.com/company/linkedin",
      "description": "Founded in 2003, LinkedIn connects the world's professionals to make them more productive and successful. With more than 364 million members worldwide, including executives from every Fortune 500 company, LinkedIn is the world's largest professional network on the Internet. The company has a diversified business model with revenue coming from Talent Solutions, Marketing Solutions and Premium Subscriptions products. Headquartered in Silicon Valley, LinkedIn has offices across the globe.",
      "specialties": [
        "Online Professional Network",
        "Jobs",
        "People Search",
        "Company Search",
        "Address Book",
        "Advertising",
        "Professional Identity",
        "Group Collaboration"
      ],
      "logo": "https://media.licdn.com/mpr/mpr/shrink_100_100/AAEAAQAAAAAAAAN5AAAAJDU0MGNhMWE5LTUxMDktNDUwZS1hMGJjLTY3ZjAwNjM5MjA5ZA.png",
      "industry": "Internet",
      "name": "LinkedIn",
      "website": "http://www.linkedin.com",
      "num_followers": 1305823,
      "type": "Public Company",
      "size": "5001-10,000",
      "year_founded": 2003,
      "street_1": "2029 Stierlin Court",
      "street_2": "",
      "locality": "Mountain View",
      "region": "CA",
      "postal_code": "94043",
      "country": "United States",
      "address": "2029 Stierlin Court, Mountain View, CA 94043 United States"
    }