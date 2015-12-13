module Vamp
  module Graphic
    # Transfer dotter data into ASCII
    class Transfer

      attr_reader :char_width
      attr_reader :char_height
      attr_reader :context
      attr_reader :mapping

      SLASH = <<-'END'
__X
_X_
X__
      END

      BACKSLASH = <<-'END'
X__
_X_
___
      END

      PIPE = <<-'END'
_X_
_X_
_X_
      END

      MINUS = <<-'END'
___
XX_
___
      END

      LINE = <<-'END'
___
___
XXX
      END

      def initialize(context)
        @context = context
        @char_width = 3
        @char_height = 3
        @mapping = {
            "/"  => create_char(SLASH),
            "\\" => create_char(BACKSLASH),
            "|"  => create_char(PIPE),
            "-"  => create_char(MINUS),
            "_"  => create_char(LINE),
        }
      end

      def check_pattern(pattern)
        a = pattern.split("\n")
        fail "pattern has wrong height" if a.size != char_height
        char_height.times do |dy|
          fail "pattern has wrong width" if a[dy].size != char_width
        end
        a
      end

      def create_char(pattern)
        char = TextDotter.new(char_width, char_height)
        a = check_pattern(pattern)
        char_height.times do |y|
          char_width.times do |x|
            char.dot(x, y) if a[y][x] == "X"
          end
        end
        char
      end

      def get_pattern(x, y)
        pattern = ""
        char_height.times do |dy|
          char_width.times do |dx|
            next unless context.in?(x + dx, y + dy)
            pattern += (context.dot?(x + dx, y + dy) ? "X" : "_")
          end
          pattern += "\n"
        end
        create_char(pattern.strip)
      end

      def difference(pattern1, pattern2)
        m = 0
        char_width.times do |dx|
          char_height.times do |dy|
            m += 1 if pattern1.dot?(dx, dy) != pattern2.dot?(dx, dy)
          end
        end
        m
      end

      def get_matching(pattern)
        mapping.each do |k, v|
          r = difference(pattern, maping[v])
          puts r
        end
      end
    end
  end
end
