require_relative "colorize"

module Vamp
  # play animation on console
  class Animator
    attr_accessor :data   # complete animation lines
    attr_accessor :number # animation source height
    attr_accessor :width  # animation width
    attr_accessor :height # animation height ( +1 if scroll)
    attr_accessor :scroll # running text data
    attr_accessor :offset # running text offset


    def initialize(file, number = 31, start = 0, height = number, scroll = nil)
      @data = []
      @number = number
      @height = height - start
      @scroll = scroll
      @height += 1 if scroll
      @offset = 0
      @width = detect_terminal_width || 80
      lines = IO.readlines(file)
      lines.each_slice(number) do |block|
        d = []
        block.each_with_index do |line, index|
#          puts line.class
#          puts printf("%-40s", line)
#          d << line
          d << (line.rstrip + (" " * 80))[0..(width - 1)] if index >= start
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

    def home(lines = height)
      print "\e[H\e[#{lines}F"
    end

    def down(lines = height)
      # lines.times { puts }
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
      "#{@scroll[(@offset / 3)..(@offset / 3 + @width - 1)]}"
    end

    def play(cycles = 1)
      if $stdout.isatty
        begin
          cursor_off
          clear
          cycles.times do
            data.each do
              |lines| animate(lines.join("\n"))
            end
          end
        ensure
          cursor_on
          # down(22)
          down(height + 1)
          # down(height + 2)
        end
      end
    end

    # stolen from <https://github.com/cldwalker/hirb/blob/master/lib/hirb/util.rb>
    # Returns width of terminal when detected, nil if not detected.
    def detect_terminal_width
      if ENV['COLUMNS'] =~ /^\d+$/
        ENV['COLUMNS'].to_i
      elsif (RUBY_PLATFORM =~ /java/ || (!STDIN.tty? && ENV['TERM'])) && command_exists?('tput')
        `tput cols`.to_i
      elsif STDIN.tty? && command_exists?('stty')
        `stty size`.scan(/\d+/)[1].to_i
      else
        nil
      end
    rescue
      nil
    end

    # Determines if a shell command exists by searching for it in ENV['PATH'].
    def command_exists?(command)
      ENV['PATH'].split(File::PATH_SEPARATOR).any? {|d| File.exists? File.join(d, command) }
    end
  end
end
