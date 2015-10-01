# encoding: UTF-8

require 'spec_helper'
require 'linkedin_scraper'

describe Linkedin::Company do
  let(:company) { Linkedin::Company.new('http://www.linkedin.com/company/1337') }
  let(:company_2) { Linkedin::Company.new('http://www.linkedin.com/company/zynga') }
  let(:company_3) { Linkedin::Company.new('http://www.linkedin.com/company/wizeline') }

  describe '#company_id' do
    it { expect(company.company_id).to eq '1337' }
  end

  describe '#profile_url' do
    it 'returns the linkedin company page url' do
      expect(company.profile_url).to match 'www.linkedin.com/company/linkedin'
    end
  end

  describe '#description' do
    it { expect(company.description).to match(/LinkedIn connects the world/) }
  end

  describe '#specialties' do
    arr = ['Online Professional Network', 'Jobs', 'People Search', 'Company Search', 'Address Book', 'Advertising', 'Professional Identity', 'Group Collaboration']
    it 'returns an array of strings, where each member is a company speciality' do 
      expect(company.specialties.class).to eq Array
      expect(company.specialties).to eq arr
    end
  end

  describe '#logo' do
    it { expect(company.logo).to match /\.png$/ }
  end

  describe '#industry' do
    it 'returns a string with the industry type' do
      expect(company.industry).to eq 'Internet'
    end
  end

  describe '#name' do
    it { expect(company.name).to eq 'LinkedIn' }
  end

  describe '#website' do
    it 'returns the company website url' do
      expect(company.website).to match 'www.linkedin.com'
    end
  end

  describe '#num_followers' do
    it { expect(company.num_followers).to be >= 1000000 }
  end

  describe '#type' do
    it { expect(company.type).to eq 'Public Company' }
  end

  describe '#size' do
    it { expect(company.size).to eq '5001-10,000' }
  end

  describe '#year_founded' do
    it { expect(company.year_founded).to eq 2003 }
  end

  describe '#street_1' do
    it { expect(company.street_1).to eq '2029 Stierlin Court' }
    it { expect(company_2.street_1).to eq nil }
  end

  describe '#street_2' do
    it { expect(company.street_2).to eq nil }
    it { expect(company_2.street_2).to eq nil }
    it { expect(company_3.street_2).to eq 'Suite 1350' }
  end

  describe '#locality' do
    it { expect(company.locality).to eq 'Mountain View' }
    it { expect(company_2.locality).to eq nil }
  end

  describe '#region' do
    it { expect(company.region).to eq 'CA' }
    it { expect(company_2.region).to eq nil }
  end

  describe '#postal_code' do
    it { expect(company.postal_code).to eq '94043' }
    it { expect(company_2.postal_code).to eq nil }
  end

  describe '#country' do
    it { expect(company.country).to eq 'United States' }
    it { expect(company_2.country).to eq nil }
  end

  describe '#related_companies' do

  end

  describe '#showcase_pages' do

  end

  describe '#affiliated_pages' do

  end

  describe '#recent_updates' do

  end

  describe '#address' do
    it 'returns a formatted address string' do
      expect(company.address).to eq('2029 Stierlin Court, Mountain View, CA 94043 United States')
      expect(company_2.address).to eq('')
    end
  end

  describe '#listed_employees' do

  end

end
