
module TheCountryIdentity

  class RDF

    @@URI_PREFIX       = "http://wifo5-03.informatik.uni-mannheim.de/factbook/data/"
    @@STATEMENT_PREFIX = "http://wifo5-04.informatik.uni-mannheim.de/factbook/ns#"

    attr_reader   :country_name
    attr_reader   :url
    attr_reader   :repo
    attr_accessor :data

    def initialize(new_country_name)
      @data ||= {}

      unless new_country_name.nil?
        @country_name = new_country_name.downcase.gsub(" ", "_").gsub("usa", "united_states")
        @url = @@URI_PREFIX + @country_name

        begin
          fetch_rdf
        rescue => e
          $log.error("Not able to get country information, through exception: #{e}")
        end

      end
    end

    def get_property(property_name)
      return @data[property_name] if @data[property_name]

      statement = nil
      unless @repo.nil?
        options = { :predicate => ::RDF::URI("#{@@STATEMENT_PREFIX}#{property_name}") }
        @repo.query(options) do |stmnt|
          statement = stmnt
        end
      end

      return statement.object.value.to_f if statement.object.literal?
    end

    private

      def fetch_rdf
        @repo = ::RDF::Repository.load(@url)
      end

  end

end
