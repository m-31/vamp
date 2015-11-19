module Vamp
  module Graphic
    # basis class for graphic implementations
    # you have to implement :dot, :undot, :clear and :screen
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

      # clear screen of all dots
      def clear
      end

      # return complete screen as string representation
      def screen
      end

      # check if (x, y) is on the screen, fails if not
      def check(x, y)
        fail "for (#{x}, #{y}}: x not in [0, #{width}["  unless (0...width)  === x
        fail "for (#{x}, #{y}}: y not in [0, #{height}[" unless (0...height) === y
      end
    end
  end
end