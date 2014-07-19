# TheCountryIdentity

[![Build Status](https://travis-ci.org/p1nox/the_country_identity.png?branch=master)](https://travis-ci.org/p1nox/the_country_identity) [![Gem Version](https://badge.fury.io/rb/the_country_identity.png)](http://badge.fury.io/rb/the_country_identity) [![Coverage Status](https://coveralls.io/repos/p1nox/the_country_identity/badge.png)](https://coveralls.io/r/p1nox/the_country_identity)

Introducing __the_country_identity__, a [CIA World Factbook](https://www.cia.gov/library/publications/the-world-factbook/) crawler gem, honoring "The Bourne Series".

The source of information is a [RDF Turtle endpoint](http://wifo5-04.informatik.uni-mannheim.de/factbook/all) included in the [D2R Server for the CIA Factbook](http://wifo5-03.informatik.uni-mannheim.de/factbook/), hosted by the [Research Group Data and Web Science](http://dws.informatik.uni-mannheim.de/en/home/) at the University of Mannheim, Germany.

## Installation

Add this line to your application's Gemfile:

    gem 'the_country_identity'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install the_country_identity

## Usage

    > country = TheCountryIdentity::RDF.new("Venezuela")
    => #<TheCountryIdentity::RDF:0x007f083417a4d8 @country_name="Venezuela", @url="http://www4.wiwiss.fu-berlin.de/factbook/data/venezuela">

    > country.population_total
    => 28,047,938

    > country.get_property("lifeexpectancyatbirth_totalpopulation")
    => 74.08

## Roadmap

* Implement HTML request approach.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

© 2012 by [Raul Pino](https://github.com/p1nox) for [Alphadeville](https://github.com/alphadeville), published under MIT license.

_Some portions of this software corresponds to [© 2012 Alex Oberhauser MIT license](https://github.com/obale/semantic_crawler/blob/develop/MIT-LICENSE) in a previous version._
