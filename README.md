# TheCountryIdentity

[![Build Status](https://travis-ci.org/p1nox/the_country_identity.png?branch=master)](https://travis-ci.org/p1nox/the_country_identity) [![Gem Version](https://badge.fury.io/rb/the_country_identity.png)](http://badge.fury.io/rb/the_country_identity) [![Coverage Status](https://coveralls.io/repos/p1nox/the_country_identity/badge.png)](https://coveralls.io/r/p1nox/the_country_identity)

Introducing __the_country_identity__, a [CIA World Factbook](https://www.cia.gov/library/publications/the-world-factbook/) crawler gem, honoring _[The Bourne Series](http://en.wikipedia.org/wiki/Bourne_Series)_.

The source of information is a [RDF Turtle endpoint](http://wifo5-04.informatik.uni-mannheim.de/factbook/all) served by the [D2R Server for the CIA Factbook](http://wifo5-03.informatik.uni-mannheim.de/factbook/) hosted by the [Research Group Data and Web Science](http://dws.informatik.uni-mannheim.de/en/home/) at the University of Mannheim, Germany.

## Installation

Add this line to your application's Gemfile:

    gem 'the_country_identity'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install the_country_identity

## Usage

    > country = TheCountryIdentity::RDF.new('venezuela')
    => #<TheCountryIdentity::RDF:0x007faaabaa1c40
       @country_name="venezuela",
       @data={},
       @repo=#<RDF::Repository:0x3fd555d50c54()>,
       @url="http://wifo5-03.informatik.uni-mannheim.de/factbook/data/venezuela">

    > country.get_property('lifeexpectancyatbirth_totalpopulation')
    => "73.28E0"

  You can find all the country property keys [here](http://wifo5-04.informatik.uni-mannheim.de/factbook/page/venezuela).

## Roadmap

* Implement HTML request approach.

## Contributing

1. Fork it.
2. Create your feature branch (`git checkout -b my-new-feature`).
3. Commit your changes (`git commit -am 'Added some feature'`).
4. Push to the branch (`git push origin my-new-feature`).
5. Create new Pull Request.

## License

© 2012 by [Raul Pino](https://github.com/p1nox) for [Alphadeville](https://github.com/alphadeville), published under MIT license.

_Some portions of this software corresponds to [© 2012 Alex Oberhauser MIT license](https://github.com/obale/semantic_crawler/blob/develop/MIT-LICENSE) in a previous version._
