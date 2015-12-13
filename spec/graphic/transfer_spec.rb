require "spec_helper"

describe Vamp::Graphic::Transfer do
  describe "screen 36x36" do
    subject { described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(9, 9))) }
    describe "#draw_line_direct" do
      it "can draw top left to right down" do
        subject.context.draw_line_direct 0, 0, 8, 8
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
        puts "\n\n" + subject.get_pattern(1, 0) + "\n\n"
        require "pp"
        pp subject.mapping
        # puts subject::SLASH
        # puts subject.create_char(subject::SLASH)
      end
    end
  end
end
