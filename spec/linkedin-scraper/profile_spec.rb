require 'spec_helper'
require 'linkedin-scraper'

describe Linkedin::Profile do

  let(:profile) { Linkedin::Profile.new('http://www.linkedin.com/in/jgrevich') }
  let(:profile_2) { Linkedin::Profile.new('http://www.linkedin.com/pub/bismarck-lepe/1/666/816') }

  describe '.get_profile' do
    it 'Create an instance of Linkedin::Profile class' do
      expect(profile).to be_instance_of Linkedin::Profile
    end
  end

  describe '#first_name' do
    it 'returns the first name of the profile' do
      expect(profile.first_name).to eq 'Justin'
    end
  end

  describe '#last_name' do
    it 'returns the last name of the profile' do
      expect(profile.last_name).to eq 'Grevich'
    end
  end

  describe '#title' do
    it 'returns the title of the profile' do
      expect(profile.title).to eq 'Presidential Innovation Fellow'
    end
  end

  describe '#location' do
    it 'returns the location of the profile' do
      expect(profile.location).to eq 'Seattle, Washington'
    end
  end

  describe '#industry' do
    it 'returns the industry of the profile' do
      expect(profile.industry).to eq 'Information Technology and Services'
    end
  end

  describe '#summary' do
    it 'returns the summary of the profile' do
      expect(profile.summary).to match(/Justin Grevich is a Presidential Innovation Fellow/)
    end
  end

  describe '#picture' do
    it 'returns the picture url of the profile' do
      expect(profile.picture).to match(/\.jpg/)
    end
  end

  describe '#skills' do
    it 'returns the array of skills of the profile' do
      arr = ['Ruby', 'Ruby on Rails', 'Web Development', 'Web Applications', 'REST', 'Drupal', 'CSS']
      expect(profile.skills).to include(*arr)
    end
  end

  describe '#past_companies' do
    it 'returns an array of hashes of past companies with its details' do
      profile.past_companies
    end
  end

  describe '#current_companies' do
    it 'returns an array of hashes of current companies with its details' do
      profile.current_companies
    end
  end

  describe '#education' do
    it 'returns the array of hashes of education with details' do
      profile.education
    end
  end

  describe '#websites' do
    it 'returns the array of websites' do
      profile.websites
    end
  end

  describe '#groups' do
    it 'returns the array of hashes of groups with details' do
      expect(profile.groups.class).to eq Array
      expect(profile.groups.any? { |m| m[:name] == 'Rubyists' }).to eq true
    end
  end

  describe '#name' do
    it 'returns the first and last name of the profile' do
      expect(profile.name).to eq 'Justin Grevich'
    end
  end

  # describe '#organizations' do
  #   pending 'returns an array of organization hashes for the profile' do
  #     expect(profile.organizations.class).to eq Array
  #     expect(profile.organizations.first[:name]).to eq 'Python Community'
  #   end
  # end

  describe '#languages' do
    it 'returns an array of languages hashes' do
      expect(profile_2.languages.class).to eq Array
    end

    it 'returns an array with one language hash' do
      expect(profile_2.languages.class).to eq Array
    end

    describe 'language hash' do
      it 'contains the key and value for language name' do
        expect(profile_2.languages.first[:language]).to eq 'English'
      end

      it 'contains the key and value for language proficiency' do
        expect(profile_2.languages.first[:proficiency]).to eq 'Native or bilingual proficiency'
      end
    end

  end # describe '.languages' do

  describe '#projects' do
    it 'returns the array of hashes of recommended visitors' do
      expect(profile.projects.class).to eq Array
    end

    it 'has at least one element' do
      expect(profile.projects.size).to be >= 1
    end
  end

  # WIP
  describe '#recommended_visitors' do
    it 'returns the array of hashes of recommended visitors' do
      profile.recommended_visitors
    end
  end

  describe '#certifications' do
    it 'returns the array of hashes of certifications' do
      profile.certifications
    end
  end

  describe '#to_json' do
    it 'returns the json format of the profile' do
      profile.to_json
    end
  end

  describe '#headline' do
    it 'returns the headline of the profile' do
      expect(profile.headline).to eq 'Presidential Innovation Fellow'
    end
  end

  describe '#member_id' do
    it 'returns the member id of the profile' do
      expect(profile.member_id).to eq '21261553'
    end
  end
end
