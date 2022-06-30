# frozen_string_literal: true

# guessing-game

require 'pry'

diff  = ''
guess = 0
guess_count = 0

# make sure input (diff) is either 'e' or 'h'
while true

  puts "Hello! Welcome to the number guessing game!\n\n"
  puts "Easy ('e') or Hard ('h') difficulty?"
  diff = gets.chomp

  case diff
  when 'e'
    range_max = 10
    diff_name = 'easy'
    break
  when 'h'
    range_max = 20
    diff_name = 'hard'
    break
  else
    puts "\n\nPlease enter either 'h' for hard, or 'e' for easy.\n\n"
  end

end

puts "You chose #{diff_name}, range is 1..#{range_max}"

answer = rand(1..range_max)

# binding.pry

while guess != answer

  puts 'Type in your guess.'
  guess = gets.chomp.to_i
  guess_count += 1

  if guess != answer
    puts 'Incorrect! Try try again.'
  else
    puts 'You got it!'
    if guess_count == 1
      puts 'It took you only one try! Great job!'
    else
      puts "It took you #{guess_count} guesses. Good job!"
    end
  end
end
