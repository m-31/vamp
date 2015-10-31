require_relative "colorize"

module Vamp
  # play animation on console
  class Animator
    attr_accessor :data   # complete animation lines
    attr_accessor :number # animation source height
    attr_accessor :width  # animation width
    attr_accessor :height # animation height
    attr_accessor :scroll # running text

    def initialize(file, number = 31, height = number, scroll)
      @data = []
      @number = number
      @width = 80
      @height = height
      @scroll = scroll
      @offset = 0
      lines = IO.readlines(file)
      lines.each_slice(number) do |block|
        d = []
        block.each_with_index do |line, index|
#          puts line.class
#          puts printf("%-40s", line)
#          d << line
          d << (line.rstrip + (" " * 80))[0..80]
#          d << sprintf("%80s", line)
#          puts block.length
          break if index >= height
        end
#        puts lines
        @data << d
      end
    end

    def clear
      print "\e[H\e[2J"
    end

    def home
      print "\e[H\e[#{height}F"
    end

    def home
      print "\e[H\e[#{height}F"
    end

    def down(lines = @height)
      # number.times { puts }
      print "\e[H\e[#{lines}E"
    end

    def flush
      $stdout.flush
    end

    def animate(msg)
      home
      puts Vamp::Colorize.colorize("red", msg)
      puts Vamp::Colorize.colorize("blue", animate_line) if scroll
      flush
      sleep(1.0/48.0)
    end

    def cursor_off
      print "\e[H\e[?25l"
    end

    def cursor_on
      print "\e[H\e[?25h"
    end

    def animate_line
      @offset += 1
      "#{@scroll[(@offset / 2)..(@offset / 2 + @width - 1)]}"
    end

    def play
      if $stdout.isatty
        begin
          cursor_off
          clear
          data.each do
            |lines| animate(lines.join("\n"))
          end
        ensure
          cursor_on
          down(@height + 2)
        end
      end
    end
  end
end
