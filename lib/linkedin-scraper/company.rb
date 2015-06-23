# -*- coding: utf-8 -*-
module Linkedin
  class Company

    USER_AGENTS = ['Windows IE 6', 'Windows IE 7', 'Windows Mozilla', 'Mac Safari', 'Mac FireFox', 'Mac Mozilla', 'Linux Mozilla', 'Linux Firefox', 'Linux Konqueror']

    ATTRIBUTES = %w(
      linkedin_url
      company_id
      profile_url
      description
      specialties
      logo
      industry
      name
      website
      num_followers
      type
      size
      year_founded
      street_1
      street_2
      locality
      region
      postal_code
      country
      address)

    attr_reader :page, :linkedin_url

    def company_id
      if @page.at('.public-follow')
        id_capture_regex = /id=(\d+)/
        @company_id ||= (id_capture_regex.match(URI.unescape(@page.at('.public-follow')['href']))[1])
      end
    end

    def profile_url
      @profile_url ||= (@page.at('meta[@property="og:url"]')[:content] if @page.at('meta[@property="og:url"]'))
    end

    def description
      @description ||= (@page.at('.basic-info-description').text.strip if @page.at('.basic-info-description'))
    end

    def specialties
      if @page.at('.specialties/p')
        @specialties ||= (@page.at('.specialties/p').text.split(',').map(&:strip))
      end
    end

    def logo
      @logo ||= (@page.at('.image-wrapper/img')['src'] if @page.at('.image-wrapper/img'))
    end

    def industry
      @industry ||= (@page.at('.industry/p').text if @page.at('.industry/p'))
    end

    def name
      @name ||= (@page.at('meta[@property="og:title"]')[:content] if @page.at('meta[@property="og:title"]'))
    end

    def website
      @website ||= (@page.at('.website a').text if @page.at('.website a'))
    end

    def num_followers
      if @page.at('.followers-count')
        @num_followers ||= (@page.at('.followers-count').children.first.text.gsub(',', '').to_i)
      end
    end

    def type
      @type ||= (@page.at('.type/p').text.strip if @page.at('.type/p'))
    end

    def size
      @size ||= (@page.at('.company-size/p').text.strip.split(' ').first if @page.at('.company-size/p'))
    end

    def year_founded
      @year_founded ||= (@page.at('.founded/p').text.to_i if @page.at('.founded/p'))
    end

    def street_1
      @street_1 ||= (@page.search('.street-address').first.text unless @page.search('.street-address').empty?)
    end

    def street_2
      @street_2 ||= (@page.search('.street-address').last.text unless @page.search('.street-address').empty?)
    end

    def locality
      @locality ||= (@page.at('.locality').text.gsub(/,$/, '') if @page.at('.locality'))
    end

    def region
      @region ||= (@page.at('.region').text if @page.at('.region'))
    end

    def postal_code
      @postal_code ||= (@page.at('.postal-code').text if @page.at('.postal-code'))
    end

    def country
      @country ||= (@page.at('.country-name').text if @page.at('.country-name'))
    end

    def address
      if street_1
        [street_1, street_2, ',', locality, ',', region, postal_code, country].join(' ').gsub(/\s{1,2},/, ',')
      else
        ''
      end
    end

    def self.get_company(url)
      Linkedin::Company.new(url)
    rescue => e
      puts e
    end

    def initialize(url)
      @linkedin_url = url
      @page         = http_client.get(url)
    end

    def to_json
      require 'json'
      ATTRIBUTES.reduce({}){ |hash,attr| hash[attr.to_sym] = self.send(attr.to_sym); hash }.to_json
    end

    private

    def http_client
      Mechanize.new do |agent|
        agent.user_agent_alias = USER_AGENTS.sample
        agent.max_history = 0
      end
    end

  end
end