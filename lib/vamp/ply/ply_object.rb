require "stringio"

module Vamp
  module Ply
    class PlyObject
      attr_reader :vertices
      attr_reader :polygons

      def initialize
        @vertices = []
        @polygons = []
        @output = StringIO.new
      end

      def add_vertex(x, y, z)
        vertices << ([x.to_f, y.to_f, z.to_f])
      end

      def add_polygon(*vertexes)
        vertexes.each do |v|
          fail "unknown vertex #{v}" unless vertices[v.to_i]
        end
        polygons << vertexes.map(&:to_i)
      end

      def to_s
        @output = StringIO.new
        print_header
        print_vertices
        print_polygons
        output.string
      end

      private

      attr_accessor :output

      def print_header
        output.puts("# ply file to describe a 3D model")
        output.puts("#")
      end

      def print_vertices
        output.puts("# list of vertices (3 float values, coordinates)")
        output.puts("# x   y   z")
        vertices.each do |v|
          output.puts("#{v[0].to_f} #{v[1].to_f} #{v[2].to_f}")
        end
        output.puts
      end

      def print_polygons
        output.puts("# list of polygons (3, 4, .. integer values, vertex indices)")
        polygons.each do |p|
          output.puts("#{p.join(' ')}")
        end
        output.puts
      end
    end
  end
end
