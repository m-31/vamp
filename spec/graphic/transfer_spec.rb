require "spec_helper"

describe Vamp::Graphic::Transfer do
  describe "screen 9x9" do
    subject do
      s = described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(9, 9)))
      s.context.draw_line_direct 0, 0, 8, 8
      s.context.draw_line_direct 2, 8, 8, 5
      s.context.draw_line_direct 7, 0, 7, 0
      s
    end
    it "has correct starting picture" do
      expect(subject.context.screen).to eq <<-'END'
+---------+
|X      X |
| X       |
|  X      |
|   X     |
|    X    |
|     X  X|
|      XX |
|    XX X |
|  XX    X|
+---------+
      END
    end

    describe "#mappping" do
      it "has correct minus pattern" do
        expect(subject.mapping["-"].screen).to eq <<-'END'
+---+
|   |
|XXX|
|   |
+---+
        END
      end
    end

    describe "#get_pattern" do
      it "gets top left pattern correct" do
        expect(subject.get_pattern(0, 0).screen).to eq <<-'END'
+---+
|X  |
| X |
|  X|
+---+
        END
      end

      it "gets top left + 1x pattern correct" do
        expect(subject.get_pattern(1, 0).screen).to eq <<-'END'
+---+
|   |
|X  |
| X |
+---+
        END
      end

      it "gets top left + 1y pattern correct" do
        expect(subject.get_pattern(0, 1).screen).to eq <<-'END'
+---+
| X |
|  X|
|   |
+---+
        END
      end

      it "gets empty pattern correct" do
        expect(subject.get_pattern(4, 1).screen).to eq <<-'END'
+---+
|   |
|   |
|   |
+---+
        END
      end

      it "gets nearly empty pattern correct" do
        expect(subject.get_pattern(4, 2).screen).to eq <<-'END'
+---+
|   |
|   |
|X  |
+---+
        END
      end

      it "gets down right pattern correct" do
        expect(subject.get_pattern(6, 5).screen).to eq <<-'END'
+---+
|  X|
|XX |
| X |
+---+
        END
      end
    end

    describe "#get_matching" do
      it "gets pipe pattern correctly" do
        p = subject.create_pattern(<<-'END'
_X_
_X_
_X_
        END
        )
        expect(subject.get_matching(p)).to eq "|"
      end

      it "gets correct ascii" do
        expect(subject.ascii).to eq "\\ '\n" \
                                    " \\ \n" \
                                    " /\\"
      end
    end
  end
  describe "screen 87x51" do
    subject do
      s = described_class.new(Vamp::Graphic::Context.new(Vamp::Graphic::TextDotter.new(87, 51)))
      s.context.line 0,   0, 43, 25
      s.context.line 43, 25, 86, 50
      s.context.line 43, 25,  0, 50
      s.context.line 43, 25, 86,  0
      s.context.line 0,  25, 43, 25
      s.context.line 43, 25, 86, 25
      s.context.line 43, 25, 43, 50
      s.context.line 43, 25, 43,  0
      s.context.line 21,  0, 43, 25
      s.context.line 65,  0, 43, 25
      s.context.line 21, 50, 43, 25
      s.context.line 65, 50, 43, 25
      s.context.line 0,  13, 43, 25
      s.context.line 86, 13, 43, 25
      s.context.line 0,  37, 43, 25
      s.context.line 86, 37, 43, 25
      s
    end
    it "has correct starting picture" do
      expect(subject.context.screen).to eq <<-'END'
+---------------------------------------------------------------------------------------+
|X                    X                     X                     X                    X|
| XX                   X                    X                    X                   XX |
|   XX                  X                   X                   X                  XX   |
|     XX                 X                  X                  X                 XX     |
|       X                 X                 X                 X                 X       |
|        XX               X                 X                 X               XX        |
|          XX              X                X                X              XX          |
|            X              X               X               X              X            |
|             XX             X              X              X             XX             |
|               XX            X             X             X            XX               |
|                 XX           X            X            X           XX                 |
|                   X           X           X           X           X                   |
|                    XX          X          X          X          XX                    |
|XX                    XX        X          X          X        XX                    XX|
|  XXXX                  X        X         X         X        X                  XXXX  |
|      XXX                XX       X        X        X       XX                XXX      |
|         XXXX              XX      X       X       X      XX              XXXX         |
|             XXXX            XX     X      X      X     XX            XXXX             |
|                 XXX           X     X     X     X     X           XXX                 |
|                    XXXX        XX    X    X    X    XX        XXXX                    |
|                        XXX       XX   X   X   X   XX       XXX                        |
|                           XXXX     X  X   X   X  X     XXXX                           |
|                               XXXX  XX X  X  X XX  XXXX                               |
|                                   XXX XXX X XXX XXX                                   |
|                                      XXXXXXXXXXX                                      |
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
|                                      XXXXXXXXXXX                                      |
|                                   XXX XXX X XXX XXX                                   |
|                               XXXX  XX X  X  X XX  XXXX                               |
|                           XXXX     X  X   X   X  X     XXXX                           |
|                        XXX       XX   X   X   X   XX       XXX                        |
|                    XXXX        XX    X    X    X    XX        XXXX                    |
|                 XXX           X     X     X     X     X           XXX                 |
|             XXXX            XX     X      X      X     XX            XXXX             |
|         XXXX              XX      X       X       X      XX              XXXX         |
|      XXX                XX       X        X        X       XX                XXX      |
|  XXXX                  X        X         X         X        X                  XXXX  |
|XX                    XX        X          X          X        XX                    XX|
|                    XX          X          X          X          XX                    |
|                   X           X           X           X           X                   |
|                 XX           X            X            X           XX                 |
|               XX            X             X             X            XX               |
|             XX             X              X              X             XX             |
|            X              X               X               X              X            |
|          XX              X                X                X              XX          |
|        XX               X                 X                 X               XX        |
|       X                 X                 X                 X                 X       |
|     XX                 X                  X                  X                 XX     |
|   XX                  X                   X                   X                  XX   |
| XX                   X                    X                    X                   XX |
|X                    X                     X                     X                    X|
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
