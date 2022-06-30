# frozen_string_literal: true

# YOUR CODE GOES HERE

# part 1

puts 'Hello there valued customer!'
puts 'How many adult tickets would you like?'
adult_tickets = gets.chomp
puts 'And how many child tickets?'
child_tickets = gets.chomp

puts "Here are your #{adult_tickets} adult tickets and #{child_tickets} child tickets!"

dehydrated_banana = 1.27
tofu_cake = 4.17
cheese_spread = 3.79
dehydrated_ice_cream_sandwich = 0.75

order1 = 2 * tofu_cake + 2 * dehydrated_ice_cream_sandwich
order2 = 8 * cheese_spread + dehydrated_banana
order3 = 3 * (dehydrated_banana + tofu_cake + cheese_spread + dehydrated_ice_cream_sandwich)

puts order1
puts order2
puts order3
