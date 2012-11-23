# TheCountryIdentity

Celebrating the premiere of "The Bourne Legacy" in Venezuela and honoring the first film "The Bourne Identity"... 

I give you __the_country_identity__, a gem for get information from [CIA World Factbook](https://www.cia.gov/library/publications/the-world-factbook/). This is based on [semantic_crawler](https://github.com/obale/semantic_crawler) appproach.

* Important! Right now the [endpoint of University of Mannheim](http://www4.wiwiss.fu-berlin.de/factbook/data/) its down.

## Installation

Add this line to your application's Gemfile:

    gem 'the_country_identity'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install the_country_identity

## Usage

    > country = TheCountryIdentity::Of.new("Venezuela")
    => #<TheCountryIdentity::Of:0x007f083417a4d8 @country_name="Venezuela", @url="http://www4.wiwiss.fu-berlin.de/factbook/data/venezuela">

    > country.population_total
    => 28,047,938

    > country.get_property("lifeexpectancyatbirth_totalpopulation")
    => 74.08

## Roadmap

* Search for more public RDF, sparql or even json endpoints for fetching data.
* Optimize data scrapping testing other gem like nokogiri.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

© 2012 by [Raul Pino](https://github.com/p1nox) for [Alphadeville](https://github.com/alphadeville), published under MIT license.

_Some portions of this software corresponds to [© 2012 Alex Oberhauser MIT license](https://github.com/obale/semantic_crawler/blob/develop/MIT-LICENSE)_
