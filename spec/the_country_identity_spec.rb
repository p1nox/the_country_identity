require 'spec_helper'

describe TheCountryIdentity do

  describe 'No data for unknown country' do
    it 'returns an empty object' do
      country = subject::RDF.new("venezuela")
    end
  end

end
