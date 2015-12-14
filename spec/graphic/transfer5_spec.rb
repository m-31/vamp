require "spec_helper"

describe Vamp::Graphic::Transfer5 do
  describe "#mappping" do
    subject do
      s = described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(5, 5)))
    end
    it "has correct minus pattern" do
      expect(subject.mapping["-"].screen).to eq <<-'END'
+-----+
|     |
|     |
|XXXX |
|     |
|     |
+-----+
      END
    end
  end
  describe "screen 145x85" do
    subject do
      s = described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(145, 85)))
      s.context.line   0,  0,   72, 42
      s.context.line  72,  42, 144,  0
      s.context.line  72,  42, 144, 84
      s.context.line   0,  84,  72, 42
      s.context.line  72,  42, 144, 42
      s.context.line  72,  42,   0, 42
      s.context.line  72,  42,  72,  0
      s.context.line  72,  42,  72, 84
      s.context.line  36,   0,  72, 42
      s.context.line 108,   0,  72, 42
      s.context.line  36,  84,  72, 42
      s.context.line 108,  84,  72, 42
      s.context.line  0,   21,  72, 42
      s.context.line 144,  21,  72, 42
      s.context.line  0,   63,  72, 42
      s.context.line 144,  63,  72, 42
      s
    end
    pending "has correct starting picture" do
      expect(subject.context.screen).to eq <<-'END'
+---------------------------------------------------------------------------------------+
      END
    end
    pending "gets correct ascii" do
      expect(subject.ascii).to eq "\\ '\n" \
                                    " \\ \n" \
                                    " /\\"
    end
  end
end
