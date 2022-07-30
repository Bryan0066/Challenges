# frozen_string_literal: true

# part 1

myHash = {
  knifeJuggling: [2.10, 0.77, 5.00, 1.00, 3.00],
  torchJuggling: [6.00, 3.50, 7.00],
  handBalancing: [2.00, 1.00],
  humanBlockhead: [0.75, 0.43]
}

tipsArray = []

myHash.each do |act, tips|
  tips.each do |x|
    tipsArray.push(x)
  end
  puts "Total Tips for #{act}: $#{format('%.2f', tips.sum)}"
end

averageTip = tipsArray.sum / tipsArray.count
puts "Total from all acts: $#{format('%.2f', tipsArray.sum)}"
puts "Average tip: $#{format('%.2f', averageTip)}"

# ___________part 2_________________

puts 'Hello Everyone, I will need a volenteer for this next act.'
puts "What's your name, brave volenteer?"

vName = gets.chomp

puts "Lets give #{vName} a big round of applause!"
puts "Okay, #{vName}, what's your favorite number?"

favNum = gets.chomp

puts "Okay then! My friend #{vName} and I will now juggle these knives for #{favNum} seconds!"
