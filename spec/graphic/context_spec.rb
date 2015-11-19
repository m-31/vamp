require "spec_helper"

describe Vamp::Graphic::Context do
  describe "screen 2x2" do
    subject { described_class.new(Vamp::Graphic::TextDotter.new(2, 2)) }
    describe "#new" do
      it "has empty screen" do
        expect(subject.screen).to eq <<-'END'
+--+
|  |
|  |
+--+
        END
      end
    end
    describe "#draw_line_direct" do
      it "can draw top left to right down" do
        subject.draw_line_direct 0, 0, 1, 1
        expect(subject.screen).to eq <<-'END'
+--+
|X |
| X|
+--+
        END
      end

      it "can draw down left to right top" do
        subject.draw_line_direct 0, 1, 1, 0
        expect(subject.screen).to eq <<-'END'
+--+
| X|
|X |
+--+
        END
      end

      it "can draw top left to right top" do
        subject.draw_line_direct 0, 0, 1, 0
        expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
        END
      end

      it "can draw down right to left down" do
        subject.draw_line_direct 1, 1, 0, 1
        expect(subject.screen).to eq <<-'END'
+--+
|  |
|XX|
+--+
        END
      end

      it "can draw top left to right down" do
        subject.draw_line_direct 0, 0, 1, 1
        expect(subject.screen).to eq <<-'END'
+--+
|X |
| X|
+--+
        END
      end
    end

    describe "#line" do
      describe "only integers, without clipping" do
        it "can draw down left to right top" do
          subject.line 0, 1, 1, 0
          expect(subject.screen).to eq <<-'END'
+--+
| X|
|X |
+--+
          END
        end

        it "can draw top left to right top" do
          subject.line 0, 0, 1, 0
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end
      end

      describe "also double, no clipping" do
        it "can draw top left to right down" do
          subject.line 0.1, 0.1, 1.9, 1.4
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end

        it "can draw top left to right top" do
          subject.line 0.0001, 0, 1.99999, 0.9
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end

        it "can draw top left to right down" do
          subject.line 0.0001, 0, 1.99999, 1
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end

        it "can draw top left to right top" do
          subject.line 0.1, 0.1, 1, 0
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end

        it "can draw top left to right top" do
          subject.line 0.9999, 0.1, 1.9999, 1.9999999
          expect(subject.screen).to eq <<-'END'
+--+
|XX|
|  |
+--+
          END
        end
      end

      describe "only integers, with clipping" do
        it "can draw down left to right top" do
          subject.line -1, -1, 2, 2
          expect(subject.screen).to eq <<-'END'
+--+
|X |
| X|
+--+
          END
        end

        it "can draw down left to right top" do
          subject.line -10, -11, 21, 22
          expect(subject.screen).to eq <<-'END'
+--+
|X |
| X|
+--+
          END
        end
      end
    end

    describe "#clear" do
      it "can clear the scren" do
        subject.line 0, 1, 1, 0
        expect(subject.clear.screen).to eq <<-'END'
+--+
|  |
|  |
+--+
        END
      end
    end
  end
end
