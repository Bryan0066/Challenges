require 'pry'

# Note: we only need `require_relative` if we end up calling a class by name in our file's logic. As such, you may have to add more `require_relative` statements accordingly.
require_relative "lib/deck"
require_relative "lib/card"
require_relative "lib/hand"

deck_1 = Deck.new

puts "GAME START!"

hand_1 = Hand.new(deck_1.deal)
hand_2 = Hand.new(deck_1.deal)

puts "There are 52 cards in the deck"
puts

puts "\tPlayer 1 was dealt #{hand_1.print_hand}"
puts "\tPlayer 2 was dealt #{hand_2.print_hand}"
puts 

player_1_score = hand_1.value
player_2_score = hand_2.value

puts "Player 1's hand value: #{hand_1.value}"
puts "Player 2's hand value: #{hand_2.value}"
puts


if player_1_score > player_2_score
    puts "Player 1 wins!"
elsif player_1_score < player_2_score
    puts "Player 2 wins!!!!!"
else
    puts "WOW ITS A TIE"
end


binding.pry