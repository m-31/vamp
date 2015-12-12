require_relative "dotter"

module Vamp
  module Graphic
    # simple sample implementation for a graphic basis implementation
    class TextDotter < Dotter
      def dot(x, y)
        super
        @data[y][x] = "X"
        self
      end

      def dot?(x, y)
        super
        @data[y][x] == "X"
      end

      def undot(x, y)
        super
        @data[y][x] = " "
        self
      end

      def clear
        @data = Array.new(height) { Array.new(width, " ") }
        self
      end

      def screen
        line = "+" + "-" * width + "+\n"
        line + @data.map { |x| "|#{x.join('')}|" }.join("\n").to_s + "\n" + line
      end
    end
  end
end
