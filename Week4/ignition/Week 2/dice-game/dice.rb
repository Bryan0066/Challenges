# frozen_string_literal: true

# dice.rb

input = ''
while input.downcase != 's'

  puts "Press any key to roll the dice, press 's' to end the program. "
  input = gets.chomp

  roll1 = rand(1..6)
  roll2 = rand(1..6)

  puts "You rolled a #{roll1} and a #{roll2}\n"
  puts "Total: #{roll1 + roll_2}\n\n"

end
