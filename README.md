# rspec-profiler

Profiles performance of your RSpec tests.

## Installation

Add this line to your application's Gemfile:

    gem 'rspec-profiler'

## Usage

In your `spec_helper.rb`:

    require 'rspec/profiler'

    RSpec.configure do |c|
      # other configuration...

      RSpec::Profiler.profile!(c)
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
