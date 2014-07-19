require 'spec_helper'

describe TheCountryIdentity do

  describe 'Data fetched from remote RDF server' do
    it 'returns a custom property' do
      country = subject::RDF.new("venezuela")
      life_expectancy = country.get_property('lifeexpectancyatbirth_totalpopulation')

      expect(life_expectancy).to be_instance_of(Float)
      expect(life_expectancy).to eq 73.28
    end
  end

end
