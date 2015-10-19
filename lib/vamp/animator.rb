module Vamp
  # play animation on console
  class Animator
    attr_accessor :data
    attr_accessor :number

    def initialize(file, number = 31)
      @data = []
      @number = number
      lines = IO.readlines(file)
      lines.each_slice(number) do |block|
        d = []
        block.each do |line|
#          puts line.class
#          puts printf("%-40s", line)
#          d << line
          d << (line.rstrip + (" " * 80))[0..80]
#          d << sprintf("%80s", line)
#          puts block.length
        end
#        puts lines
        @data << d
      end
    end

    def clear
      print "\e[H\e[2J"
    end

    def home
      print "\e[H\e[#{number}F"
    end

    def home
      print "\e[H\e[#{number}F"
    end

    def down
      # number.times { puts }
      print "\e[H\e[#{number}E"
    end

    def flush
      $stdout.flush
    end

    def animate(msg)
      home
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
          clear
          data.each { |lines| animate(lines.join("\n"))}
        ensure
          cursor_on
          down
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