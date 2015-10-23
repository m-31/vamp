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
