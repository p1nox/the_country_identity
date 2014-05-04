
module TheCountryIdentity

  class RDF

    @@URI_PREFIX = "http://www4.wiwiss.fu-berlin.de/factbook/data/"
    # new rdf to test "http://wifo5-04.informatik.uni-mannheim.de/factbook/resource/"

    # Predefined RDFS/OWL namespaces used for RDF file parsing
    @@NAMESPACES = {
      "factbook" => "http://www4.wiwiss.fu-berlin.de/factbook/ns#",
      "rdfs" => "http://www.w3.org/2000/01/rdf-schema#",
      "rdf" => "http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    }

    attr_reader :country_name

    attr_reader :url

    def initialize(new_country_name)
      if !new_country_name.nil?
        @country_name = new_country_name
        @url = @@URI_PREFIX + @country_name.downcase.gsub(" ", "_").gsub("usa", "united_states")
        begin
          fetch_rdf
        rescue => e
          $log.error("Not able to get country information, through exception: #{e}")
        end
      end
    end

    # Returns the country name (rdfs:label)
    # XXX: If nothing was found this method returns
    # <?xml version="1.0"?>
    def name
      get_rdfs_property("label", "/rdf:RDF/rdf:Description/factbook:landboundary/factbook:Country")
    end

    # Returns background information about the country
    def background
      get_property("background")
    end

    # Returns background information about the country
    def population_total
      get_property("population_total")
    end

    # Returns geographiccoordinates latitude
    def latitude
      get_property("geographiccoordinates_latitude")
    end

    # Returns geographiccoordinates longitude
    def longitude
      get_property("geographiccoordinates_longitude")
    end

    # Returns landboundary
    def landboundary
      if !@doc.nil?
        @doc.xpath("//factbook:landboundary/rdf:Description/@rdf:about", @@NAMESPACES)
      else
        nil
      end
    end

    # Returns terrain description (human readable)
    def terrain
      get_property("terrain")
    end

    # Returns the total number of airports in the country
    def airports_total
      get_property("airports_total")
    end

    # Returns the number of helicopter airports
    def heliports
      get_property("heliports")
    end

    # Returns climate description (human readable)
    def climate
      get_property("climate")
    end

    # Returns location description (human readable)
    def location
      get_property("location")
    end


    # Abstract method that allows to fetch factbook properties via xpath
    def get_property(property_name, prefix = "/")
      if !@doc.nil?
        @doc.xpath(prefix + "/factbook:" + property_name + "/text()", @@NAMESPACES)
      else
        nil
      end
    end

    # @return [String] The document serialized as XML
    def xml_document
      @doc.to_s
    end

    # Abstract method that allows to fetch rdfs properties via xpath
    def get_rdfs_property(property_name, prefix = "/")
      if !@doc.nil?
        @doc.xpath(prefix + "/rdfs:" + property_name + "/text()", @@NAMESPACES)
      else
        nil
      end
    end

    private

      # Retrieves the RDF stream
      def fetch_rdf
        @doc = Nokogiri::XML(open(@url))
      end

  end

end
