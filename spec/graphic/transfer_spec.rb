require "spec_helper"

describe Vamp::Graphic::Transfer do
  describe "screen 36x36" do
    subject do
      s = described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(9, 9)))
      s.context.draw_line_direct 0, 0, 8, 8
      s
    end
    it "has correct starting picture" do
      expect(subject.context.screen).to eq <<-'END'
+---------+
|X        |
| X       |
|  X      |
|   X     |
|    X    |
|     X   |
|      X  |
|       X |
|        X|
+---------+
      END
    end

    it "gets top left pattern correct" do
      expect(subject.get_pattern(0, 0).screen).to eq <<-'END'
+---+
|X  |
| X |
|  X|
+---+
      END
    end
  end
end
