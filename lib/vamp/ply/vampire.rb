require "stringio"

require_relative "ply_object"

module Vamp
  module Ply
    class Vampire < PlyObject

      def initialize(file, number = 31)
        super()
        @file = file
        @number = number
        d = 0.2
        add_vertex(d, 1, 1)          # 0
        add_vertex(d, 0.4, 1)        # 1
        add_vertex(d, -1, 0)         # 2
        add_vertex(d, 0.4, -1)       # 3
        add_vertex(d, 1, -1)         # 4
        add_vertex(d, -0.4, 0)       # 5
        add_vertex(-d, 1, 1)         # 6
        add_vertex(-d, 0.4, 1)       # 7
        add_vertex(-d, -1, 0)        # 8
        add_vertex(-d, 0.4, -1)      # 9
        add_vertex(-d, 1, -1)        # 10
        add_vertex(-d, -0.4, 0)      # 11
        add_polygon(0, 1, 2, 3, 4, 5)
        add_polygon(6, 7, 8, 9, 10, 11)
        add_polygon(0, 1, 7, 6)
        add_polygon(1, 2, 8, 7)
        add_polygon(2, 3, 9, 8)
        add_polygon(3, 4, 10, 9)
        add_polygon(4, 5, 11, 10)
        add_polygon(5, 0, 6, 11)
      end
    end
  end
end

if __FILE__ == $0
  # get root directory of this gem
  creator = Vamp::Ply::Vampire.new(File.join("vampire.txt"))
  puts creator
end
