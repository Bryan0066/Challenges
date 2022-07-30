# frozen_string_literal: true

# tracking-donations

require 'pry'

donations = 0

# while loop accepts input until donations >= 100
while donations < 100
  puts 'Please enter your donation amount:'
  new_donation = gets.chomp.to_i
  donations += new_donation
end

puts "We've reached our goal of $100! Thanks to all that donated!"

# if statement checking donations, and how many "25s" are added to the 100 needed.

extra = (donations - 100) / 25 if donations >= 125

# binding.pry

extra.times do
  puts "You've earned another $25!"
end
