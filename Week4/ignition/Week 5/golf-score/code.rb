#My code goes here

score = {
    'par'  => [5,4,3,4,4,3,4,5,4,5,4,4,3,4,4,4,3,5],
    'strokes' => [7,5,3,4,4,2,5,5,5,7,4,4,3,5,5,4,3,6]
}

puts "Total Strokes:#{score['strokes'].sum}"
puts "Total Par: #{score['par'].sum} "
puts "You were #{score['strokes'].sum - score['par'].sum } over par."
