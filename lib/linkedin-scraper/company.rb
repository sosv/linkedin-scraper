# -*- coding: utf-8 -*-
module Linkedin
  class Company

    USER_AGENTS = ['Windows IE 6', 'Windows IE 7', 'Windows Mozilla', 'Mac Safari', 'Mac FireFox', 'Mac Mozilla', 'Linux Mozilla', 'Linux Firefox', 'Linux Konqueror']

    ATTRIBUTES = %w()

    attr_reader :page, :linkedin_url

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