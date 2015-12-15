module Vamp
  module Graphic
    # Transfer dotter data into ASCII
    class Transfer5

      attr_reader :char_width
      attr_reader :char_height
      attr_reader :context
      attr_reader :mapping

      SPACE = <<-'END'
_____
_____
_____
_____
_____
      END

      SLASH = <<-'END'
___X_
__X__
_X___
X____
_____
      END

      BACKSLASH = <<-'END'
X____
_X___
__X__
___X_
_____
      END

      BACKTICK = <<-'END'
_X___
_____
_____
_____
_____
      END

      PIPE = <<-'END'
__X__
__X__
__X__
__X__
_____
      END

      MINUS = <<-'END'
_____
_____
XXXX_
_____
_____
      END

      UNDERSCORE = <<-'END'
_____
_____
_____
_____
XXXXX
      END

      FULLSTOP = <<-'END'
_____
_____
_____
__X__
_____
      END

      DOUBLEQUOTES = <<-'END'
_X_X_
_____
_____
_____
_____
      END

      SINGLEQUOTE = <<-'END'
__X__
_____
_____
_____
_____
      END

      STAR = <<-'END'
_____
__X__
_XXX_
__X__
_____
      END

      HASH = <<-'END'
_____
_XXX_
_XXX_
_XXX_
_____
      END

      def initialize(context)
        @context = context
        @char_width = 5
        @char_height = 5
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
        match = ranking.min_by{|k, v| v}
        match[0..1]
      end


      def ascii
        a = ""
        (context.height / char_height).times do |y|
          (context.width / char_width).times do |x|
            m = get_matching(get_pattern(x * char_width, y * char_height))
            if (m[1] > 0)
              n = []
              n << get_matching(get_pattern(x * char_width + 1, y * char_height))
              n << get_matching(get_pattern(x * char_width - 1, y * char_height))
              n << get_matching(get_pattern(x * char_width, y * char_height + 1))
              n << get_matching(get_pattern(x * char_width, y * char_height - 1))
              n.each do |v|
                if v[1] < m[1]
                  m = v
                end
              end
            end
            a += m[0]
          end
          a += "\n"
        end
        a.chomp
      end
    end
  end
end
