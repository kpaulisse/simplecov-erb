# SimpleCov::Formatter::ERBFormatter

## Overview

This project was born out of the need to display a coverage summary in the plain text output of CI jobs, along the lines of:

```
--------------------------------------------------------------------------------
Incomplete test coverage
--------------------------------------------------------------------------------

/lib/my-app/data/groups/calculated.rb: 44.9% (missed: 33,34,35,36,37,38,48,49,61,62,64,67,68,70,71,72,74,77,78,83,86,101,102,103,104,106,108)
/lib/my-app/data/groups/file.rb: 60.87% (missed: 21,22,23,24,25,36,47,48,49)
/lib/my-app/data/groups/ldap.rb: 45.65% (missed: 23,24,25,26,27,38,39,42,49,50,51,52,54,57,69,70,73,81,82,83,84,88,99,109,121)
/lib/my-app/data/ldap.rb: 68.63% (missed: 93,95,96,97,98,99,100,102,103,104,105,106,107,109,113,115)
```

However, since the most flexible way to generate this output was via a template, this project generalizes the approach to render the output from the user's choice of ERB file. The [default template](/views/simplecov.erb) produces output like above, but it's possible to configure the ERB file anywhere on the file system. For use in CI, perhaps you'll want your template right there in your project next to your tests.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "simplecov-erb", require: false
```

To pull in the dependencies:

```
$ script/bootstrap
```

Or install it yourself as:

```
$ gem install simplecov-erb
```

## Usage

At this point, it's assumed you've already set up [SimpleCov](https://github.com/colszowka/simplecov) and that it's all configured and working. Once you're to that point, edit your `spec_helper.rb`, `test_helper.rb`, or `.simplecov` like below:

```ruby
# test_helper.rb

require "simplecov-erb"

SimpleCov.start do
  # You need this line for sure.
  SimpleCov.formatter = SimpleCov::Formatter::ERBFormatter

  # You can choose a different template if you don't want to use the default.
  SimpleCov::Formatter::ERBFormatter.erb_file = "/some/path/template.erb"

  # Sometimes it's handy to have the ERB file be relative to *this* file. So instead
  # of the previous line, you could do this instead.
  SimpleCov::Formatter::ERBFormatter.erb_file = File.expand_path("./templates/template.erb", File.dirname(__FILE__))

  # You can choose a different output filename if you don't want to use "coverage.txt".
  # This file will still appear in the "coverage" directory (or whatever directory
  # you configured SimpleCov to output to).
  SimpleCov::Formatter::ERBFormatter.output_filename = "my-custom-coverage.report.txt"
end
```

## Development

Fork the repo and run `script/bootstrap` to install dependencies. Then, run `script/cibuild` to run the tests.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kpaulisse/simplecov-erb. Contributors are expected to adhere to the [code of conduct](/CODE_OF_CONDUCT.md) published in this repository.

## License

The gem is available as open source under the terms of the [MIT License](/LICENSE).
