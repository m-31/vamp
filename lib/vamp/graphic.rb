require_relative "graphic/context"

module Vamp
  module Graphic
  end
end

if __FILE__ == $0
  g = Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(80, 20))
  g.dot(10, 10)
  g.line 1, 2, 70, 9

  g.draw 40, 10, 100, 1
  puts g.screen
  puts "now we get an error:"
  g.line 1, 1, 100, 100
end
