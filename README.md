# TheCountryIdentity

[![Build Status](https://travis-ci.org/p1nox/the_country_identity.png?branch=master)](https://travis-ci.org/p1nox/the_country_identity) [![Gem Version](https://badge.fury.io/rb/the_country_identity.png)](http://badge.fury.io/rb/the_country_identity) [![Coverage Status](https://coveralls.io/repos/p1nox/the_country_identity/badge.png)](https://coveralls.io/r/p1nox/the_country_identity)

Celebrating the premiere of "The Bourne Legacy" and honoring the first film "The Bourne Identity"... I give you __the_country_identity__, a [CIA World Factbook](https://www.cia.gov/library/publications/the-world-factbook/) crawler gem. Based on [semantic_crawler](https://github.com/obale/semantic_crawler) approach for now.

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

* Look for others public RDF, sparql or even json endpoints for fetching data.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

© 2012 by [Raul Pino](https://github.com/p1nox) for [Alphadeville](https://github.com/alphadeville), published under MIT license.

_Some portions of this software corresponds to [© 2012 Alex Oberhauser MIT license](https://github.com/obale/semantic_crawler/blob/develop/MIT-LICENSE)_
