
module TheCountryIdentity

  class HTML

    @@URI_PREFIX = "http://wifo5-04.informatik.uni-mannheim.de/factbook/page/"

    attr_reader :country_name

    attr_reader :url

    def initialize(new_country_name)
      if !new_country_name.nil?
        @country_name = new_country_name
        @url = @@URI_PREFIX + @country_name.downcase.gsub(" ", "_").gsub("usa", "united_states")
        begin
          fetch_page
        rescue => e
          $log.error("Not able to get country information, through exception: #{e}")
        end
      end
    end

    # Abstract method that allows to fetch factbook properties via CSS3 selectors
    def get_property(property_name)
      if !@doc.nil?
        @doc.css("")
      else
        nil
      end
    end

    # @return [String] The document serialized as HTML
    def html_document
      @doc.to_s
    end

    private

      # Retrieves the HTML stream
      def fetch_page
        @doc = Nokogiri::HTML(open(@url))
      end

  end

end
