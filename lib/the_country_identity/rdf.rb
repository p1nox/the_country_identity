
module TheCountryIdentity

  class RDF

    @@URI_PREFIX       = 'http://wifo5-03.informatik.uni-mannheim.de/factbook/data/'
    @@STATEMENT_PREFIX = 'http://wifo5-04.informatik.uni-mannheim.de/factbook/ns#'

    attr_accessor :cache
    attr_reader   :country_name
    attr_reader   :url
    attr_reader   :repository

    def initialize(country_name)
      @cache = {}
      @country_name = country_name.downcase.gsub(' ', '_').gsub('usa', 'united_states')
      @url = @@URI_PREFIX + @country_name
    end

    def get_property(property_name)
      return @cache[property_name] if @cache[property_name]

      begin
        unless repo.nil?
          options = { :predicate => ::RDF::URI("#{@@STATEMENT_PREFIX}#{property_name}") }
          repo.query(options) do |stmnt|
            @cache[property_name] = stmnt.object.value
          end
        end
      rescue => e
        puts "Not able to get country information, through exception: #{e}"
      end

      @cache[property_name]
    end

    private

      def repo
        @repository ||= ::RDF::Repository.load(@url)
      end

  end

end
