# frozen_string_literal: true

# advanced_dice.rb

puts "\n\nHow many sides should the dice have?"
sides = gets.chomp.to_i

puts "\n\nHow many rolls?"
dice = gets.chomp.to_i

input = ''
rolls = []
while input.downcase != 's'
  dice.times { rolls.push(rand(1..sides)) }
  rolls.each do |x|
    puts "You rolled a #{x}"
  end

  puts "Total: #{rolls.sum}\n\n"

  puts 'Press any key to roll the dice'
  input = gets.chomp

  rolls = []

end
