module Vamp
  module Graphic
    # Transfer dotter data into ASCII
    class Transfer

      attr_reader :char_width
      attr_reader :char_height
      attr_reader :context
      attr_reader :mapping

      SPACE = <<-'END'
___
___
___
      END

      SLASH = <<-'END'
__X
_X_
X__
      END

      BACKSLASH = <<-'END'
X__
_X_
__X
      END

      BACKTICK = <<-'END'
X__
___
___
      END

      PIPE = <<-'END'
_X_
_X_
_X_
      END

      MINUS = <<-'END'
___
XXX
___
      END

      UNDERSCORE = <<-'END'
___
___
XXX
      END

      FULLSTOP = <<-'END'
___
___
_X_
      END

      DOUBLEQUOTES = <<-'END'
X_X
___
___
      END

      SINGLEQUOTE = <<-'END'
_X_
___
___
      END

      STAR = <<-'END'
_X_
XXX
_X_
      END

      HASH = <<-'END'
XXX
XXX
XXX
      END

      def initialize(context)
        @context = context
        @char_width = 3
        @char_height = 3
        @mapping = {
            " "  => create_pattern(SPACE),
            "/"  => create_pattern(SLASH),
            "\\" => create_pattern(BACKSLASH),
            "`"  => create_pattern(BACKTICK),
            "|"  => create_pattern(PIPE),
            "-"  => create_pattern(MINUS),
            "_"  => create_pattern(UNDERSCORE),
            "."  => create_pattern(FULLSTOP),
            "\"" => create_pattern(DOUBLEQUOTES),
            "'"  => create_pattern(SINGLEQUOTE),
            "*"  => create_pattern(STAR),
            "\#" => create_pattern(HASH),
        }
      end

      def create_data(pattern)
        a = pattern.split("\n")
        fail "pattern has wrong height" if a.size != char_height
        char_height.times do |dy|
          fail "pattern has wrong width" if a[dy].size != char_width
        end
        a
      end

      def create_pattern(pattern)
        char = TextDotter.new(char_width, char_height)
        a = create_data(pattern)
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
            if context.in?(x + dx, y + dy)
              pattern += (context.dot?(x + dx, y + dy) ? "X" : "_")
            else
              pattern += "_"
            end
          end
          pattern += "\n"
        end
        create_pattern(pattern.strip)
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
        ranking = {}
        mapping.each do |k, v|
          r = difference(pattern, v)
          ranking[k] = r
        end
        ranking.min_by{|k, v| v}[0]
      end


      def ascii
        a = ""
        (context.height / char_height).times do |y|
          (context.width / char_width).times do |x|
            a += get_matching(get_pattern(x * char_width, y * char_height))
          end
          a += "\n"
        end
        a.chomp
      end
    end
  end
end
