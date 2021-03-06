require 'spec_helper'

describe TheCountryIdentity do

  describe 'No data fetched for unknown country' do

    before do
      @country = subject::RDF.new('operation_treadstone')
    end

    it 'creates a new RDF instance' do
      expect(@country).to be_instance_of(subject::RDF)
    end

    it 'sets correct country_name' do
      expect(@country.country_name).to be_instance_of(String)
      expect(@country.country_name).to eq 'operation_treadstone'
    end

    it 'sets correct url' do
      expect(@country.url).to be_instance_of(String)
      expect(@country.url).to eq 'http://wifo5-03.informatik.uni-mannheim.de/factbook/data/operation_treadstone'
    end

    it 'sets correct repository (RDF::Repository)' do
      @country.get_property('lifeexpectancyatbirth_totalpopulation')
      expect(@country.repository).to be_nil
    end

    it 'sets initial value to be cached' do
      expect(@country.cache).to be_instance_of(Hash)
      expect(@country.cache.empty?).to be_truthy
    end

    it 'returns nil value for a given property' do
      life_expectancy = @country.get_property('lifeexpectancyatbirth_totalpopulation')
      expect(life_expectancy).to be_nil
    end

  end

  describe 'Data fetched from remote RDF server for a known country' do

    before do
      @country = subject::RDF.new('venezuela')
    end

    it 'creates a new RDF instance' do
      expect(@country).to be_instance_of(subject::RDF)
    end

    it 'sets correct country_name' do
      expect(@country.country_name).to be_instance_of(String)
      expect(@country.country_name).to eq 'venezuela'
    end

    it 'sets correct url' do
      expect(@country.url).to be_instance_of(String)
      expect(@country.url).to eq 'http://wifo5-03.informatik.uni-mannheim.de/factbook/data/venezuela'
    end

    it 'sets correct repository (RDF::Repository)' do
      @country.get_property('lifeexpectancyatbirth_totalpopulation')
      expect(@country.repository).to be_instance_of(::RDF::Repository)
      expect(@country.repository.readable?).to be_truthy
      expect(@country.repository.writable?).to be_truthy
      expect(@country.repository.persistent?).to be_falsey
      expect(@country.repository.transient?).to be_truthy
      expect(@country.repository.empty?).to be_falsey
      expect(@country.repository.count).to be 197
    end

    it 'sets initial value to be cached' do
      expect(@country.cache).to be_instance_of(Hash)
      expect(@country.cache.empty?).to be_truthy
    end

    it 'returns a custom value for a given property' do
      property = 'lifeexpectancyatbirth_totalpopulation'
      life_expectancy = @country.get_property(property)
      expect(life_expectancy).to be_instance_of(String)
      expect(life_expectancy).to eq '73.28E0'
      expect(@country.cache[property]).to eq '73.28E0'
    end

    it 'returns nil value for a given unknown property' do
      property = 'operation_blackbriar'
      life_expectancy = @country.get_property(property)
      expect(life_expectancy).to be_nil
      expect(@country.cache[property]).to be_nil
    end

  end

end
