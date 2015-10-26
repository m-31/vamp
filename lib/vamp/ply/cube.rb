require "stringio"

require_relative "ply_object"

module Vamp
  module Ply
    class Cube < PlyObject

      def initialize(file, number = 31)
        super()
        @file = file
        @number = number
        add_vertex(1, 1, 1)
        add_vertex(-1, 1, 1)
        add_vertex(1, -1, 1)
        add_vertex(1, 1, -1)
        add_vertex(1, -1, -1)
        add_vertex(-1, -1, 1)
        add_vertex(-1, 1, -1)
        add_vertex(-1, -1, -1)
        add_polygon(0, 1, 5, 2)
        add_polygon(0, 1, 6, 3)
        add_polygon(0, 3, 4, 2)
        add_polygon(2, 5, 7, 4)
        add_polygon(1, 6, 7, 5)
        add_polygon(3, 6, 7, 4)
      end

    end
  end
end

if __FILE__ == $0
  # get root directory of this gem
  creator = Vamp::Ply::Cube.new(File.join("vampire.txt"))
  puts creator
end
