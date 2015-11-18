require_relative "graphic/context"

module Vamp
  module Graphic
  end
end

if __FILE__ == $0
  g = Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(80, 20))
  g.dot(10, 10)
  g.line 1, 2, 70, 9
  puts g.screen
  g.line 1, 1, 100, 100
end