# Bsi18nScaffold
This wraps my I18n enabled Bootstrap scaffolding.

Out of the box, Rails scaffolding is not I18n capable and has a bunch of hard
coded error and success messages in the controller and templates.  To work with 
I18n, this gem adds translation helpers and provides I18n capable erb and controller
scaffolding templates.  It also adds required translation YML files for English and 
Japanese (the RailsI18n does not include them).

Scaffolding is fairly project specific though so I don't know if this has enough 
legs to warrant pushing it to Rubygems.


## Usage

## Installation
Add this line to your application's Gemfile:

```ruby
gem "bsi18n_scaffold", git: "https://github.com/jpgeek/bsi18n_scaffold"
```

And then execute:
```bash
$ bundle
```

To inlcude the translation helper methods, add this to your 
``` app/helpers/applicaition_helper.rb
```

```include Bsi18nScaffold::ScaffoldHelper
```

To copy the templates into your lib directory, run:
```bash
$ rake bsi18n_scaffold:copy_template
```

and then slash and burn as needed.

## Contributing
Translations are welcome, as are other template sets (erb, slim, haml etc).

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
