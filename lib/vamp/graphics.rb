require "forwardable"

module Vamp

  include Forwardable

  class Dotter
    attr_reader :width        # number of dots in x direction
    attr_reader :height       # number of dots in y direction

    def initialize(width, height)
      @width = width
      @height = height
      clear
    end

    # put dot at x, ys
    def dot(x, y)
      check(x, y)
    end

    # remove dot at x, y
    def undot(x, y)
      check(x, y)
    end

    # check if (x, y) is on the screen, fails if not
    def check(x, y)
      fail "for (#{x}, #{y}}: x not in [0, #{width}["  unless (0...width)  === x
      fail "for (#{x}, #{y}}: y not in [0, #{height}[" unless (0...height) === y
    end

    # clear screen of all dots
    def clear
    end

    # return complete screen as string
    def screen
    end
  end

  # sample implementation
  class TextDotter < Dotter
    def dot(x, y)
      super
      @data[y][x] = "X"
    end

    def undot(x, y)
      super
      @data[y][x] = " "
    end

    def clear
      @data = Array.new(height) { Array.new(width, " ") }
    end

    def screen
      line = "+" + "-" * width + "+\n"
      line + @data.map { |x| "|#{x.join('')}|" }.join("\n").to_s + "\n" + line
    end
  end

  # play animation on console
  class Graphics
    extend Forwardable

    def_delegators :@dotter, :dot, :undot, :clear, :screen

    attr_reader :dotter       # can set a dot within [0, width] [0, height[]]

    def initialize(dotter)
      @dotter = dotter
    end

    # Bresenham's line algorithm
    def line(x0, y0, x1, y1)
      dx = (x1 - x0).abs
      sx = x0 < x1 ? 1 : -1
      dy = -(y1 - y0).abs
      sy = y0 < y1 ? 1 : -1
      err = dx + dy
      while true
        dot(x0, y0)
        break if x0 == x1 && y0 == y1
        e2 = 2 * err
        if e2 > dy
          err += dy
          x0 += sx;
        end
        if e2 < dx
          err += dx
          y0 += sy;
        end
      end
    end

  end

end

g = Vamp::Graphics.new(Vamp::TextDotter.new(80, 20))
g.dot(10, 10)
g.line 1, 2, 70, 9
puts g.screen
g.line 1, 1, 100, 100