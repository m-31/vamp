require "forwardable"
require_relative "dotter"
require_relative "text_dotter"

module Vamp
  module Graphic
    # Graphic Context
    class Context
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
end
