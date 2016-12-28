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
    it "has correct starting picture" do
      expect(subject.context.screen).to eq <<-'END'
+-------------------------------------------------------------------------------------------------------------------------------------------------+
|X                                   X                                   X                                   X                                   X|
| XX                                  X                                  X                                  X                                  XX |
|   XX                                 X                                 X                                 X                                 XX   |
|     XX                                X                                X                                X                                 X     |
|       X                               X                                X                                X                               XX      |
|        XX                              X                               X                               X                              XX        |
|          XX                             X                              X                              X                             XX          |
|            X                             X                             X                             X                             X            |
|             XX                            X                            X                            X                            XX             |
|               XX                           X                           X                           X                           XX               |
|                 XX                          X                          X                          X                           X                 |
|                   X                         X                          X                          X                         XX                  |
|                    XX                        X                         X                         X                        XX                    |
|                      XX                       X                        X                        X                       XX                      |
|                        X                       X                       X                       X                       X                        |
|                         XX                      X                      X                      X                      XX                         |
|                           XX                     X                     X                     X                     XX                           |
|                             XX                    X                    X                    X                     X                             |
|                               X                   X                    X                    X                   XX                              |
|                                XX                  X                   X                   X                  XX                                |
|                                  XX                 X                  X                  X                 XX                                  |
|XX                                  X                 X                 X                 X                 X                                  XX|
|  XXXX                               XX                X                X                X                XX                               XXXX  |
|      XXX                              XX               X               X               X               XX                              XXX      |
|         XXXX                            XX              X              X              X               X                            XXXX         |
|             XXX                           X             X              X              X             XX                          XXX             |
|                XXX                         XX            X             X             X            XX                         XXX                |
|                   XXXX                       XX           X            X            X           XX                       XXXX                   |
|                       XXX                      X           X           X           X           X                      XXX                       |
|                          XXXX                   XX          X          X          X          XX                   XXXX                          |
|                              XXX                  XX         X         X         X         XX                  XXX                              |
|                                 XXXX                XX        X        X        X         X                XXXX                                 |
|                                     XXX               X       X        X        X       XX              XXX                                     |
|                                        XXX             XX      X       X       X      XX             XXX                                        |
|                                           XXXX           XX     X      X      X     XX           XXXX                                           |
|                                               XXX          X     X     X     X     X          XXX                                               |
|                                                  XXXX       XX    X    X    X    XX       XXXX                                                  |
|                                                      XXX      XX   X   X   X   XX      XXX                                                      |
|                                                         XXXX    XX  X  X  X   X    XXXX                                                         |
|                                                             XXX   X X  X  X XX  XXX                                                             |
|                                                                XXX XXX X XXX XXX                                                                |
|                                                                   XXXXXXXXXXX                                                                   |
|XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX|
|                                                                   XXXXXXXXXXX                                                                   |
|                                                                XXX XXX X XXX XXX                                                                |
|                                                             XXX   X X  X  X XX  XXX                                                             |
|                                                         XXXX    XX  X  X  X   X    XXXX                                                         |
|                                                      XXX      XX   X   X   X   XX      XXX                                                      |
|                                                  XXXX       XX    X    X    X    XX       XXXX                                                  |
|                                               XXX          X     X     X     X     X          XXX                                               |
|                                           XXXX           XX     X      X      X     XX           XXXX                                           |
|                                        XXX             XX      X       X       X      XX             XXX                                        |
|                                     XXX               X       X        X        X       XX              XXX                                     |
|                                 XXXX                XX        X        X        X         X                XXXX                                 |
|                              XXX                  XX         X         X         X         XX                  XXX                              |
|                          XXXX                   XX          X          X          X          XX                   XXXX                          |
|                       XXX                      X           X           X           X           X                      XXX                       |
|                   XXXX                       XX           X            X            X           XX                       XXXX                   |
|                XXX                         XX            X             X             X            XX                         XXX                |
|             XXX                           X             X              X              X             XX                          XXX             |
|         XXXX                            XX              X              X              X               X                            XXXX         |
|      XXX                              XX               X               X               X               XX                              XXX      |
|  XXXX                               XX                X                X                X                XX                               XXXX  |
|XX                                  X                 X                 X                 X                 X                                  XX|
|                                  XX                 X                  X                  X                 XX                                  |
|                                XX                  X                   X                   X                  XX                                |
|                               X                   X                    X                    X                   XX                              |
|                             XX                    X                    X                    X                     X                             |
|                           XX                     X                     X                     X                     XX                           |
|                         XX                      X                      X                      X                      XX                         |
|                        X                       X                       X                       X                       X                        |
|                      XX                       X                        X                        X                       XX                      |
|                    XX                        X                         X                         X                        XX                    |
|                   X                         X                          X                          X                         XX                  |
|                 XX                          X                          X                          X                           X                 |
|               XX                           X                           X                           X                           XX               |
|             XX                            X                            X                            X                            XX             |
|            X                             X                             X                             X                             X            |
|          XX                             X                              X                              X                             XX          |
|        XX                              X                               X                               X                              XX        |
|       X                               X                                X                                X                               XX      |
|     XX                                X                                X                                X                                 X     |
|   XX                                 X                                 X                                 X                                 XX   |
| XX                                  X                                  X                                  X                                  XX |
|X                                   X                                   X                                   X                                   X|
+-------------------------------------------------------------------------------------------------------------------------------------------------+
      END
    end
    it "gets correct ascii" do
      expect(subject.ascii.split("\n").map(&:rstrip).join("\n")).to eq (<<-'END'
`      \      |      /      '
  \     \     |     /     /
    .    \    |         .`
     '        |        `
--     \      |   `  /     --
   "-_   . '  |  / /`  _-"
      "-_ ' ' | ' ` _-`
          -- \|/ -"
-------------###-------------
          -- "|\ -_
       -`` `  | \'  '-
   --    /  ` |    \    --
-"     /`  /  |  '   .     "-
      `   `   |   '   '
    '    /    |    \    `
  /     /     |     \     \
.`            |      \      .
      END
      ).rstrip
    end

    # here is the 3 x 3 result
    pending "gets correct ascii" do
      expect(subject.ascii.split("\n").map(&:rstrip).join("\n")).to eq (<<-'END'
\_     \      |      /     _/
  \     \     |     /     /`
   '_    .    |    .`   _`
     `.   .   |   .`  .'
\_     \      |   `  /`    _/
  "-__  '\ '  |  ' /`  __-"
      `-_ '_' | '_' _-'`
         "\\/\|////"
-------------###-------------
         _////|\/\\_
      _-" .'.`| .`. "-_
  _-'`  _/`.` |  . \_  '`-_
/"     /`  `  |      \     "\
     _'   '   |   '   '_
   _'    '    |    '    `_
  /`    /     |     \     \
/`     /      |      \     '\
      END
      ).rstrip
    end
  end
end
