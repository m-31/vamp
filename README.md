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

## Usage with thor

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

## Animation Usage

You can play an ascii art animation within a terminal window by using vamp.

```ruby
require "vamp"

animator = Vamp::Animator.new(File.join(Gem.loaded_specs["vamp"].gem_dir, "files", "vampire.txt"), 31, 0, 24,
  "No man knows till he has suffered from the night how sweet and how dear to his heart and eye the morning can be.")
animator.play
```

To see the animation in higher resolution just klick on the following image.

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
