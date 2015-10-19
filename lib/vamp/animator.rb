module Vamp
  # play animation on console
  class Animator
    attr_accessor :data

    def initialize(file, number = 31)
      @data = []
      lines = IO.readlines(file)
      lines.each_slice(number) do |block|
        @data << block
      end
    end

    def clear
      print "\e[H\e[2J"
    end

    def flush
      $stdout.flush
    end

    def animate(msg)
      clear
      print msg
      flush
      sleep(1.0/24.0)
    end

    def cursor_off
      print "\e[H\e[?25l"
    end

    def cursor_on
      print "\e[H\e[?25h"
    end

    def play
      if $stdout.isatty
        begin
          cursor_off
          data.each { |lines| animate(lines.join(""))}
        ensure
          cursor_on
        end
      end
    end
  end
end

if __FILE__ == $0
  # get root directory of this gem
  animator = Vamp::Animator.new(File.join(Gem.loaded_specs["vamp"].gem_dir, "files", "pyramid.txt"))
  animator.play
end