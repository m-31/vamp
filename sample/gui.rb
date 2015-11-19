require "green_shoes"

=begin
Shoes.app do
  flow do
    stack :width => 200 do
      background lavender
      caption "Column one"
      para "is 200 pixels wide"
    end
    stack :width => -200 do
      background bisque
      caption "Column two"
      para "is 100% minus 200 pixels wide"
    end
  end
end
=end

=begin
 Shoes.app do
   fill black.push(0.1)
   100.times do |i|
     oval i, i, i * 2 if i > 0
   end
 end

=end

=begin
Shoes.app width: 800, height:900, margin: 10, title: "VAMP GUI" do
  stack width: 800, height: 200, margin: 10 do
    border black, strokewidth: 2
  end
end
=end

=begin
Shoes.app do
  lb = list_box items: COLORS.keys.map(&:to_s), choose: 'red' do |s|
    @o.style fill: eval(s.text)
    @p.text = s.text
  end.move(300, 0)
  @p = para
  nostroke
  @o = oval 100, 100, 100, 100
  i = 0
  button('print'){para lb.text, top: 20*(i+=1)}.move(500, 0)
end

=end

=begin
Shoes.app do
  background chocolate..black, angle: 130
  strokewidth 20
  border deeppink..forestgreen, curve: 30
  nostroke
  fill crimson..cyan
  oval 100, 100, 100, 100, angle: 45
  nofill
  strokewidth 50
  rect 200, 200, 300, 200, stroke: darkblue..ivory, angle: 90
end

=end

=begin
Shoes.app width: 400, height: 400 do
  cap [:rect, :curve, :project][rand 3]
  background lightgrey
  rect 0, 0, 100, 100
  rect 100, 100, 100, 100
  rect 200, 200, 100, 100
  rect 0, 200, 100, 100
  rect 200, 0, 100, 100
  stroke File.join(DIR, '../static/gshoes-icon.png')
  strokewidth 10
  line 355, 180, 5, 111, strokewidth: 20
  stroke red
  line 0, 0, 100, 0
  line 0, 100, 0, 0
  line 300, 200, 200, 200
  line 100, 200, 200, 100
  stroke white
  line 200, 200, 200, 300
  line 300, 200, 200, 100
end
=end

Shoes.app width: 800, height: 600 do
  background lightgrey
  strokewidth 1
  stroke black
  d = 10
  (height / d + 1).times { |i| line 0, i * d, width, i * d }
  (width / d + 1).times { |i| line i * d, 0, i * d, height }
end