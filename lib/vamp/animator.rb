require File.join(File.dirname(__FILE__), "colorize")

module Vamp
  # play animation on console
  class Animator
    attr_accessor :data           # complete animation lines
    attr_accessor :number         # animation source height
    attr_accessor :width          # animation width
    attr_accessor :height         # animation height ( +1 if scroll_text)
    attr_accessor :scroll_text    # running text data
    attr_accessor :scroll_counter # for calculating running text offset
    attr_accessor :ani_color      # animation color (if any: "red", "blue", ..)
    attr_accessor :text_color     # text color (if any: "blue", "green", ...)


    def initialize(file, number = 31, start = 0, height = number, scroll_text = nil, cycles = 1)
      @data = []
      @number = number
      @height = height - start
      @scroll_text = scroll_text
      @cycles = cycles
      @width = detect_terminal_width || 80
      if scroll_text
        @height += 1
        @scroll_counter = 0
        @scroll_text = (" " * @width) + scroll_text + (" " * @width)
      end
      @ani_color = "red"
      @text_color = "blue"
      lines = IO.readlines(file)
      lines.each_slice(number) do |block|
        d = []
        block.each_with_index do |line, index|
          d << (line.rstrip + (" " * 80))[0..(width - 1)] if index >= start
          break if index >= height
        end
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

    def scroll_offset
      @scroll_counter / 3
    end

    def animate(msg)
      home
      if ani_color
        puts Vamp::Colorize.colorize(ani_color, msg)
      else
        puts msg
      end
      if scroll_text
        if text_color
          puts Vamp::Colorize.colorize(text_color, running_line)
        else
          puts running_line
        end
      end
      flush
      sleep(1.0/48.0)
    end

    def running_line
      @scroll_counter += 1
      "#{scroll_text[scroll_offset..(scroll_offset + width - 1)]}"
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
          data.each { |lines| animate(lines.join("\n")) } until finished?
        ensure
          cursor_on
          down(height + 1)
        end
      else
        puts "sorry, I must have a tty device to play an animation"
      end
    end

    def finished?
      if scroll_text
        scroll_offset + width >= scroll_text.size
      else
        @cycle ||= 0
        @cycle += 1
        @cycle > @cycles
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
