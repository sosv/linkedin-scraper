require 'spec_helper'
require 'linkedin-scraper'

describe Linkedin::Company do
  let(:company) { Linkedin::Company.new('http://www.linkedin.com/company/1337') }
  let(:company_2) { Linkedin::Company.new('') }

  describe '#company_id' do
    it { expect(company.company_id).to be eq '1337' }
  end

  describe '#profile_url' do
    it 'returns the linkedin company page url' do
      expect(company.profile_url).to eq 'http://www.linkedin.com/company/linkedin'
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
  
  describe '#url' do
    it 'returns the company website url' do
      expect(company.url).to eq 'http://www.linkedin.com'
    end
  end
  
  describe '#followers' do
    it { expect(company.followers).to be >= 1000000 }
  end
  
  describe '#type' do
    it { expect(company.type).to eq 'Public Company' }
  end

  describe '#size' do
    it { expect(company.size).to eq '5001-10,000' }
  end

  describe '#year_founded' do
    it { expect(company.year_founded).to eq '2013' }
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
    
  end
  
  describe '#listed_employees' do

  end

end