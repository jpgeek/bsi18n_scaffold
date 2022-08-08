# Bsi18nScaffold
This wraps my I18n enabled Bootstrap scaffolding.

Out of the box, Rails scaffolding is not I18n capable and has a bunch of hard
coded error and success messages in the controller and templates.  To work with 
I18n, I added a bunch of translation helpers and modified the erb and controller
scaffolding templates.  I also added in translation files for japanese and english,
but if anyone cares to contribute more I would be happy to chuck em in. Note that
RailsI18n does not have the required translations for this.

Scaffolding is fairly project specific though so I don't know if this has enough 
legs to warrant pushing it to Rubygems and adding all the tests.


## Usage

## Installation
Add this line to your application's Gemfile:

```ruby
gem "bsi18n_scaffold"
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install bsi18n_scaffold
```

To inlcude the translation helper methods, add this to your 
``` app/helpers/applicaition_helper.rb
```

```include Bsi18nScaffold::ScaffoldHelper
```

You can then run:

## Contributing
Contribution directions go here.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
