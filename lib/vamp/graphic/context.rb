require "forwardable"
require_relative "dotter"
require_relative "text_dotter"
require_relative "transfer"

module Vamp
  module Graphic
    # Graphic Context
    class Context
      extend Forwardable

      def_delegators :@dotter, :dot, :dot?, :undot, :in?, :clear, :screen, :width, :height

      attr_reader :dotter       # can set a dot within [0, width] [0, height[]]

      def initialize(dotter)
        @dotter = dotter
      end

      # Cohen–Sutherland clipping algorithm clips a line from
      # P0 = (x0, y0) to P1 = (x1, y1) against a rectangle with
      # diagonal from (xmin, ymin) to (xmax, ymax).
      def line(x0, y0, x1, y1)
        xmin = 0.0
        ymin = 0.0
        xmax = width - 1.0
        ymax = height - 1.0

        # compute outcodes for P0, P1, and whatever point lies outside the clip rectangle
        outcode0 = compute_out_code(x0, y0)
        outcode1 = compute_out_code(x1, y1)

        accept = false

        while true
          if 0 == (outcode0 | outcode1)     # Bitwise OR is 0. Trivially accept and get out of loop
            accept = true
            break
          elsif 0 != (outcode0 & outcode1)  # Bitwise AND is not 0. Trivially reject and get out of loop
            break
          else
            # failed both tests, so calculate the line segment to clip
            # from an outside point to an intersection with clip edge

            # At least one endpoint is outside the clip rectangle; pick it.
            outcodeOut = outcode0 != 0 ? outcode0 : outcode1


            # Now find the intersection point;
            # use formulas y = y0 + slope * (x - x0), x = x0 + (1 / slope) * (y - y0)
            if 0 != (outcodeOut & TOP)            # point is above the clip rectangle
              x = x0.to_f + (x1 - x0) * (ymax - y0) / (y1 - y0)
              y = ymax
            elsif (0 != outcodeOut & BOTTOM)      # point is below the clip rectangle
              x = x0.to_f + (x1 - x0) * (ymin - y0) / (y1 - y0)
              y = ymin
            elsif (0 != outcodeOut & RIGHT)       # point is to the right of clip rectangle
              y = y0.to_f + (y1 - y0) * (xmax - x0) / (x1 - x0)
              x = xmax
            elsif (0 != outcodeOut & LEFT)        # point is to the left of clip rectangle
              y = y0.to_f + (y1 - y0) * (xmin - x0) / (x1 - x0)
              x = xmin
            end

            # Now we move outside point to intersection point to clip
            # and get ready for next pass.
            if outcodeOut == outcode0
              x0 = x
              y0 = y
              outcode0 = compute_out_code(x0, y0)
            else
              x1 = x
              y1 = y
              outcode1 = compute_out_code(x1, y1)
            end
          end
        end
        if accept
          draw_line_direct (x0 + 0.5).to_i, (y0 + 0.5).to_i, (x1 + 0.5).to_i, (y1 + 0.5).to_i
        end
        self
      end

      protected

      # Bresenham's line algorithm
      def draw_line_direct(x0, y0, x1, y1)
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
            x0 += sx
          end
          if e2 < dx
            err += dx
            y0 += sy
          end
        end
        self
      end

      # clipping area constants
      INSIDE  = 0; # 0000
      LEFT    = 1; # 0001
      RIGHT   = 2; # 0010
      BOTTOM  = 4; # 0100
      TOP     = 8; # 1000

      # Compute the bit code for a point (x, y) using the clip rectangle
      # bounded diagonally by (xmin, ymin), and (xmax, ymax)
      def compute_out_code(x, y)
        xmin = 0
        ymin = 0
        xmax = width - 1
        ymax = height - 1
        code = INSIDE    # initialised as being inside of clip window

        if x < xmin      # to the left of clip window
          code |= LEFT
        elsif x > xmax   # to the right of clip window
          code |= RIGHT
        end
        if y < ymin      # below the clip window
          code |= BOTTOM
        elsif y > ymax   # above the clip window
          code |= TOP
        end
        code
      end
    end
  end
end
