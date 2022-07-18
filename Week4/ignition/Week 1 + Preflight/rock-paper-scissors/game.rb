# frozen_string_literal: true

require 'pry'

player_choice = ''

# asks user for input, loops until acceptable input
if %w[r p s].include? player_choice
  puts 'Choose rock (r), paper (p), or scissors (s):'
  player_choice = gets.chomp.downcase
end

puts "Player choice: #{player_choice}"

computer_choice_options = {
  0 => 'rock',
  1 => 'paper',
  2 => 'scissors'
}

computer_choice = computer_choice_options[rand(3)]
puts "Computer choice: #{computer_choice}"

# binding.pry

case computer_choice
when computer_choice.chr == player_choice then puts "It's a tie!"
when computer_choice == 'rock' && player_choice == 's'     then puts 'Computer wins!'
when computer_choice == 'rock' && player_choice == 'p'     then puts 'Player wins!'
when computer_choice == 'scissors' && player_choice == 'r' then puts 'Player wins!'
when computer_choice == 'scissors' && player_choice == 'p' then puts 'Computer wins!'
when computer_choice == 'paper' && player_choice == 's'    then puts 'Player wins!'
when computer_choice == 'paper' && player_choice == 'r'    then puts 'Computer wins!'
end
