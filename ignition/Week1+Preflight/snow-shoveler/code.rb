# frozen_string_literal: true

require 'pry'

# script function:
# asks for area and calculates price.

puts "Welcome to Frosty's Snow Removal Service!"
puts 'Please follow the prompts for a quote. Press any key to begin.'
# variable "delay" is not used anywhere, it's for a delay in the prompts.
delay = gets.chomp

puts 'How wide is the launchpad in feet?'
width = gets.chomp.to_i

puts 'How long is the launchpad in feet?'
length = gets.chomp.to_i

puts 'How deep is the snow in inches?'
depth = gets.chomp.to_i
# converts inches input to feet
depth_feet = depth / 12

# binding.pry

def pricing(w, l, d)
  # area formula
  snow_area = w * l * d
  snow_area.round

  # pricing logic
  case snow_area
  when ..49     then '$20'
  when 50..149  then '$50'
  when 150..299 then '$100'
  when 300..    then '$150'
  else 'something went wrong'
  end
end

price = pricing(width, length, depth_feet)
puts "For a #{width}x#{length} launchpad with #{depth} inches of snow, the price will be: #{price}."
