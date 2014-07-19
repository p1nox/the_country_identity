
module TheCountryIdentity

  class RDF

    @@URI_PREFIX       = 'http://wifo5-03.informatik.uni-mannheim.de/factbook/data/'
    @@STATEMENT_PREFIX = 'http://wifo5-04.informatik.uni-mannheim.de/factbook/ns#'

    attr_reader   :country_name
    attr_reader   :url
    attr_reader   :repo
    attr_accessor :data

    def initialize(new_country_name)
      fetch_country new_country_name
    end

    def get_property(property_name)
      return @data[property_name] if @data[property_name]

      unless @repo.nil?
        options = { :predicate => ::RDF::URI("#{@@STATEMENT_PREFIX}#{property_name}") }
        @repo.query(options) do |stmnt|
          @data[property_name] = stmnt.object.value
        end
      end

      @data[property_name]
    end

    def fetch_country(country_name)
      @data = {}
      unless country_name.nil?
        @country_name = country_name.downcase.gsub(' ', '_').gsub('usa', 'united_states')
        @url = @@URI_PREFIX + @country_name

        begin
          fetch_rdf
        rescue => e
          puts "Not able to get country information, through exception: #{e}"
        end
      end
    end

    private

      def fetch_rdf
        @repo = ::RDF::Repository.load(@url)
      end

  end

end
