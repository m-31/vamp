# Vamp - necessities for the elegant vampire

Want to pimp up your command line interface?
Just require this gem insert some code and your CLI makes witty vampire quotes.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'vamp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install vamp

## Usage

```ruby

require "thor"
require "vamp"

class CLI < Thor
  include Vamp

  def initialize(*args)
    at_exit { thats_all_folks }
    super
  end

  desc "example", "an example task"
  def example
    puts "I'm a thor task!"
  end

  private

  def thats_all_folks
    say
    say VAMPIRE, :yellow
    say
    say "    \"#{quote}\"", :blue
    say
  end
end

CLI.start(ARGV)
```

## Animation

Klick on the animation to get a better movie:

[![Animation Demo](https://raw.githubusercontent.com/m-31/vamp/data/pic/demo_001.gif)](https://raw.githubusercontent.com/m-31/vamp/data/pic/demo_001.mp4)


## Development

After checking out the repo, run `bundle install` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/m-31/vamp/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
